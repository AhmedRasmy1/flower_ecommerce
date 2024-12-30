import 'dart:ui';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flower_ecommerce/core/provider.dart';
import 'package:provider/provider.dart';
import 'core/resources/theme_manager.dart';
import 'localization/locale_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'core/di/di.dart';
import 'core/resources/color_manager.dart';
import 'core/resources/routes_manager.dart';
import 'core/utils/cashed_data_shared_preferences.dart';
import 'core/utils/my_bloc_observer.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flower_ecommerce/services/notificttionservice.dart';
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message: ${message.messageId}');
}

const _kTestingCrashlytics = true;
const _kShouldTestAsyncErrorOnInit = false;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheService.cacheInitialization();

  const AndroidInitializationSettings initializationSettingsAndroid =
  AndroidInitializationSettings('@mipmap/ic_launcher');
  const InitializationSettings initializationSettings =
  InitializationSettings(android: initializationSettingsAndroid);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  Bloc.observer = MyBlocObserver();
  configureDependencies();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.top]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  runApp(const FlowerApp());
}
class FlowerApp extends StatefulWidget {
  const FlowerApp({super.key});
  @override
  State<FlowerApp> createState() => _FlowerAppState();
}
class _FlowerAppState extends State<FlowerApp> {
  late FirebaseMessaging _messaging;
  @override
  void initState() {
    super.initState();
    _messaging = FirebaseMessaging.instance;
    _requestPermission();
    _setupInteractedMessage();
  }
  Future<void> _requestPermission() async {
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined permission');
    }
  }
  void _setupInteractedMessage() {
    _getToken();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print(
          'Received a new message: ${message.notification?.title} - ${message.notification?.body}');
      if (message.notification != null) {
        NotificationService.instance.showNotification(message);
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('Message clicked!');
    });
  }
  Future<void> _getToken() async {
    String? token = await _messaging.getToken();
    print('FCM Token: $token');
  }
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: ColorManager.white,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => SortProvider()),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => LocaleCubit()),
          ],
          child: Builder(
            builder: (context) {
              final fontFamily =
              context.read<LocaleCubit>().changeFontFamily();
              return MaterialApp(
                locale: context.watch<LocaleCubit>().state,
                localizationsDelegates: [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: [
                  const Locale('en'),
                  const Locale('ar'),
                ],
                builder: EasyLoading.init(),
                theme: getApplicationTheme().copyWith(
                  textTheme: getApplicationTheme()
                      .textTheme
                      .apply(fontFamily: fontFamily),
                ),
                debugShowCheckedModeBanner: false,
                onGenerateRoute: RouteGenerator.getRoute,
                initialRoute: RoutesManager.splashRoute,
              );
            },
          ),
        ),
      ),
    );
  }
}