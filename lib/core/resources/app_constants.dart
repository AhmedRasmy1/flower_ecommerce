import 'package:flutter/material.dart';

import '../../Features/cart&checkout/presentation/views/cart_view.dart';
import '../../Features/categories/presentation/pages/categories_view.dart';
import '../../Features/home/presentation/pages/home_view.dart';
import '../../Features/profile/presentation/pages/profile_view.dart';

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

bool isSelectGender = false;
bool isSelectGender2 = true;
