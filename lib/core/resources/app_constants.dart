import 'package:flower_ecommerce/Features/cart/presentation/pages/cart_view.dart';
import 'package:flower_ecommerce/Features/categories/presentation/pages/categories_view.dart';
import 'package:flower_ecommerce/Features/home/presentation/pages/home_view.dart';
import 'package:flower_ecommerce/Features/profile/presentation/pages/profile_view.dart';
import 'package:flutter/material.dart';

class AppConstants {
  static const int splashDelay = 3;
  static const double screenWidthRatio = 2.3;
  static const int listGenerate = 6;
  static const viewOptions = <Widget>[
    HomeView(),
    CategoriesView(),
    CartView(),
    ProfileView(),
  ];
}
 bool isSelectGender =false;
 bool isSelectGender2 =true;