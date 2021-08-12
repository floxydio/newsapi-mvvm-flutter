import 'package:flutter/material.dart';

class DarkMode with ChangeNotifier {
  bool _isDark = true;

  bool get isDark => _isDark;

  set isDark(value) {
    _isDark = value;
    notifyListeners();
  }

  Color get color => (isDark) ? Colors.white : Colors.black;
  Color get text => (isDark) ? Colors.black : Colors.white;
}
