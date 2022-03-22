import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/keyboard/keyboard_manager.dart';

class GuessManager extends ChangeNotifier {

  int currentGuessNumber = 0;
  List<String> guesses = [];
  String actualWord = "APPLE";

  void updateGuessNumber() {
    if (currentGuessNumber < 5) {
      currentGuessNumber += 1;
      notifyListeners();
    }
    else {
      print("GameOver");
    }
  }

  void evaluateGuess(String guess) {

    guesses.add(guess);

    if (actualWord == guess) {
      print("correct guess");
    }
    else {
      print("incorrect guess");
    }
  }
}