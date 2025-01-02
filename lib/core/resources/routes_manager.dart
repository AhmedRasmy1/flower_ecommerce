import 'package:flower_ecommerce/Features/notifications_list/presentation/view/notifications_list_view.dart';
import 'package:flower_ecommerce/Features/orders/presentation/view/orders_view.dart';
import 'package:flower_ecommerce/Features/search/presentation/views/empty_search_view.dart';
import 'package:flower_ecommerce/Features/search/presentation/views/search_screen_view.dart';

import '../../Features/add_address/presentation/pages/address_view.dart';
import '../../Features/address/saved_address/presentation/view/saved_address.dart';
import '../../Features/cart&checkout/presentation/views/check_out_view.dart';
import '../../Features/payment/presentation/view/payment_cash_page.dart';
import '../../Features/payment/presentation/view/payment_online_page.dart';
import '../../Features/profile/presentation/pages/terms_and_conditions.dart';
import 'package:flutter/material.dart';

import '../../Features/auth/presentation/views/email_verification_view.dart';
import '../../Features/auth/presentation/views/forget_password.dart';
import '../../Features/auth/presentation/views/login_view.dart';
import '../../Features/auth/presentation/views/register_view.dart';
import '../../Features/auth/presentation/views/reset_password_view.dart';
import '../../Features/best_seller/presentation/view/best_seller_view.dart';
import '../../Features/cart&checkout/presentation/views/cart_view.dart';
import '../../Features/edit_profile/presentation/view/edit_profile_view.dart';
import '../../Features/home/presentation/pages/home_view.dart';
import '../../Features/layout/presentation/pages/layout_view.dart';
import '../../Features/occasions/presentation/views/occasions_view.dart';
import '../../Features/products_details/presentation/views/product_details_view.dart';
import '../../Features/products_details/presentation/widgets/try_screen.dart';
import '../../Features/profile/presentation/pages/about_us_page.dart';
import '../../Features/profile/presentation/pages/profile_view.dart';
import '../../Features/profile_reset_password/presentation/view/change_password_view.dart';
import '../../splash_view.dart';

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
  static const String layoutRoute = '/layoutRoute';
  static const String checkOutRoute = '/checkOutRoute';
  static const String productDetailsRoute = '/productDetailsRoute';
  static const String tryScreenRoute = '/tryScreenRoute';
  static const String bestSellerRoute = '/bestSellerRoute';
  static const String occassionViewRoute = '/occassionViewRoute';
  static const String logoutViewRoute = '/logout';
  static const String changePasswordViewRoute = '/chanePasswordViewRoute';
  static const String editProfileRoute = '/editProfileRoute';
  static const String termsAndConditionsPageRoute =
      '/TermsAndConditionsPageRoute';
  static const String aboutUsPageRoute = '/AboutUsPageRoute';
  static const String savedAddress = '/savedAddress';
  static const String addAddressView = '/addAddressView';
  static const String notificationsListView = '/notificationListView';
  static const String ordersView = '/MyOrdersPage';
  static const String paymentCashView = '/PaymentCashPage';
  static const String paymentOnlineView = '/PaymentOnlinePage';
  static const String emptySearchView = '/emptySearchView';
  static const String searchView='/searchView';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case RoutesManager.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case RoutesManager.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case RoutesManager.profileRoute:
        return MaterialPageRoute(builder: (_) => const ProfileView());
      case RoutesManager.loginRoute:
        return MaterialPageRoute(
          builder: (_) => const LoginView(),
        );
      case RoutesManager.registerRoute:
        return MaterialPageRoute(
            builder: (_) => const RegisterView(), settings: settings);
      case RoutesManager.cartRoute:
        return MaterialPageRoute(builder: (_) => const CartView());
      case RoutesManager.checkOutRoute:
        return MaterialPageRoute(
          builder: (_) => const CheckOutView(),
        );
      case RoutesManager.occassionViewRoute:
        return MaterialPageRoute(builder: (_) => const OccasionsView());
      case RoutesManager.forgetPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordView());

      case RoutesManager.resetPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ResetPasswordView());
      case RoutesManager.emailVerificationRoute:
        return MaterialPageRoute(builder: (_) => const OtpVerificationPage());
      case RoutesManager.layoutRoute:
        return MaterialPageRoute(builder: (_) => const LayoutView());
      case RoutesManager.termsAndConditionsPageRoute:
        return MaterialPageRoute(
            builder: (_) => const TermsAndConditionsPage());
      case RoutesManager.aboutUsPageRoute:
        return MaterialPageRoute(builder: (_) => const AboutUsPage());

      case RoutesManager.tryScreenRoute:
        return MaterialPageRoute(builder: (_) => const TryScreen());
      case RoutesManager.productDetailsRoute:
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => ProductDetailsView(productId: args),
          );
        }
        return unDefinedRoute();
      // case RoutesManager.productDetailsRoute:
      //   return MaterialPageRoute(builder: (_) =>  ProductDetailsView(productId: "673e2d1b1159920171828146",));
      case RoutesManager.bestSellerRoute:
        return MaterialPageRoute(builder: (_) => const BestSellerView());
      case RoutesManager.changePasswordViewRoute:
        return MaterialPageRoute(builder: (_) => const ChangePasswordScreen());
      case RoutesManager.savedAddress:
        return MaterialPageRoute(builder: (_) => const SavedAddress());
      case RoutesManager.editProfileRoute:
        return MaterialPageRoute(
            builder: (_) => const EditProfileView(), settings: settings);
      case RoutesManager.addAddressView:
        return MaterialPageRoute(builder: (_) => const AddressView());
      case RoutesManager.notificationsListView:
        return MaterialPageRoute(builder: (_) => const NotificationsListView());
      case RoutesManager.ordersView:
        return MaterialPageRoute(builder: (_) => const MyOrdersPage());
      case RoutesManager.paymentCashView:
        return MaterialPageRoute(builder: (_) => const PaymentCashPage());
      case RoutesManager.paymentOnlineView:
        return MaterialPageRoute(builder: (_) => const PaymentOnlinePage());
      case RoutesManager.emptySearchView:
        return MaterialPageRoute(builder: (_) => const EmptySearchView());
      case RoutesManager.searchView:
        return MaterialPageRoute(builder: (_) => const SearchScreenView());
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
