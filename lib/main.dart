import 'package:flower_ecommerce/core/resources/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'core/di/di.dart';
import 'core/resources/color_manager.dart';
import 'core/resources/routes_manager.dart';
import 'core/utils/cashed_data_shared_preferences.dart';
import 'core/utils/my_bloc_observer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheService.cacheInitialization();
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
      child: MaterialApp(
        builder: EasyLoading.init(),
        theme: getApplicationTheme(),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: RoutesManager.splashRoute,
      ),
    );
  }
}
