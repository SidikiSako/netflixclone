import 'package:flutter/material.dart';

class IndexProvider with ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void updateCurrentIndex({required int newIdex}) {
    _currentIndex = newIdex;
    print("currentIndex = $_currentIndex");
    notifyListeners();
  }
}
