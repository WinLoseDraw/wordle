import 'package:flutter/material.dart';

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