import 'package:flutter/material.dart';
class SortProvider with ChangeNotifier {
 String? filterType ;
void changeFilter(String? newFilter)
 {
   filterType= newFilter ;
   notifyListeners();
}

}