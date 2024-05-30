import 'package:flutter/material.dart';

class Global extends ChangeNotifier {
  static final Global _instance = Global._internal();

  factory Global() {
    return _instance;
  }

  Global._internal();
  Color _selectedColor = Colors.deepPurple[400]!;
  Color get selectedColor => _selectedColor;

  void setColor(Color color) {
    _selectedColor = color;
    notifyListeners();
  }
}