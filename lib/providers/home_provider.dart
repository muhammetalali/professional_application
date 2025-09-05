import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  int _currentScreenIndex = 0;

  int get currentScreenIndex => _currentScreenIndex;

  void changeScreen(int index) {
    _currentScreenIndex = index;
    notifyListeners(); // هذا السطر يضمن التفاعل والتحديث
  }

  void resetToHome() {
    _currentScreenIndex = 0;
    notifyListeners();
  }
}