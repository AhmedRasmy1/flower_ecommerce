
import 'package:flower_ecommerce/Features/cart/presentation/pages/cart_view.dart';
import 'package:flower_ecommerce/Features/home/presentation/pages/home_view.dart';
import 'package:flower_ecommerce/Features/profile/presentation/pages/profile_view.dart';
import 'package:flower_ecommerce/splash_view.dart';
import 'package:flutter/material.dart';
import '../../Features/auth/presentation/views/email_verification_view.dart';
import '../../Features/auth/presentation/views/forget_password.dart';
import '../../Features/auth/presentation/views/login_view.dart';
import '../../Features/auth/presentation/views/register_view.dart';
import '../../Features/auth/presentation/views/reset_password_view.dart';

class RoutesManager {
  static const String splashRoute = '/';
  static const String homeRoute = '/homeRoute';
  static const String profileRoute = '/profileRoute';
  static const String loginRoute = '/loginRoute';
  static const String registerRoute = '/registerRoute';
  static const String cartRoute = '/cartRoute';
  static const String forgetPasswordRoute = '/forgetPassword';
  static const String emailVerificationRoute = '/emailVerification';
  static const String resetPasswordRoute = '/resetPassword';


}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesManager.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case RoutesManager.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case RoutesManager.profileRoute:
        return MaterialPageRoute(builder: (_) => const ProfileView());
      case RoutesManager.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case RoutesManager.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case RoutesManager.cartRoute:
        return MaterialPageRoute(builder: (_) => const CartView());
      case RoutesManager.forgetPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordView());
      case RoutesManager.resetPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ResetPasswordView());
      case RoutesManager.emailVerificationRoute:
        return MaterialPageRoute(builder: (_) => const OtpVerificationPage());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text("No Route Found"),
              ),
              body: const Center(child: Text("No Route Found")),
            ));
  }
}
