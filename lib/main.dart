import 'package:flower_ecommerce/core/resources/theme_manager.dart';
import 'package:flower_ecommerce/localization/locale_cubit.dart';
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
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheService.cacheInitialization();
  Bloc.observer = MyBlocObserver();
  configureDependencies();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.top]);
  runApp(
    // DevicePreview(
    //   enabled: !kReleaseMode,
    //   builder: (context) {
    //     return const FlowerApp();
    //   },
    // ),
    const FlowerApp(),
  );
}

class FlowerApp extends StatelessWidget {
  const FlowerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: ColorManager.white,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: BlocProvider(
        create: (_) => LocaleCubit(),
        child: BlocBuilder<LocaleCubit, Locale>(
          builder: (context, locale) {
            final fontFamily = context.read<LocaleCubit>().changeFontFamily();
            return MaterialApp(
              locale: locale,
              localizationsDelegates: [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: [
                Locale('en'), // English
                Locale('ar'), // Arabic
              ],
              builder: EasyLoading.init(),
              theme: getApplicationTheme().copyWith(
                textTheme: getApplicationTheme().textTheme.apply(
                      fontFamily: fontFamily,
                    ),
              ),
              debugShowCheckedModeBanner: false,
              onGenerateRoute: RouteGenerator.getRoute,
              initialRoute: RoutesManager.splashRoute,
            );
          },
        ),
      ),
    );
  }
}
