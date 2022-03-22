import 'package:flutter/material.dart';

class KeyboardManager extends ChangeNotifier {

  String currentValue = "";

  void updateValue(String addedValue) {
    if (currentValue.length < 5) {
      currentValue += addedValue;
      notifyListeners();
    }
  }

  void deleteLast() {
    if (currentValue.length > 1) {
      currentValue = currentValue.substring(0, currentValue.length-1);
    }
    else {
      currentValue = "";
    }
    notifyListeners();
  }

  void reset() {
    currentValue = "";
    notifyListeners();
  }
}