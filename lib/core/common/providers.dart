// sort_type_provider.dart
import 'package:flutter/material.dart';
class SortTypeProvider with ChangeNotifier {
  String _currentSortType = 'Default';
  String get currentSortType => _currentSortType;
  void updateSortType(String newSortType) {
    _currentSortType = newSortType;
    notifyListeners(); // Notify listeners about the change
  }
}