import 'package:device_preview/device_preview.dart';
import 'package:flower_ecommerce/core/di/di.dart';
import 'package:flower_ecommerce/core/resources/color_manager.dart';
import 'package:flower_ecommerce/core/resources/routes_manager.dart';
import 'package:flower_ecommerce/core/utils/cashed_data_shared_preferences.dart';
import 'package:flower_ecommerce/core/utils/my_bloc_observer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedData.cacheInitialization();
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
    return const AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: ColorManager.white,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: RoutesManager.splashRoute,
      ),
    );
  }
}
