// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class GuessManager extends ChangeNotifier {

  int currentGuessNumber = 0;
  List<String> guesses = [];
  List<List<Color>> colors = [[Colors.black, Colors.black, Colors.black, Colors.black, Colors.black], [Colors.black, Colors.black, Colors.black, Colors.black, Colors.black], [Colors.black, Colors.black, Colors.black, Colors.black, Colors.black], [Colors.black, Colors.black, Colors.black, Colors.black, Colors.black], [Colors.black, Colors.black, Colors.black, Colors.black, Colors.black], [Colors.black, Colors.black, Colors.black, Colors.black, Colors.black]];

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

    for (int i = 0; i < guess.length; i++) {
      String letter = guess[i];
      if (actualWord.contains(letter)) {
        if (actualWord[i] == letter) {
          colors[currentGuessNumber][i] = Colors.green;
        }
        else {
          colors[currentGuessNumber][i] = Color(0xFFFBC02D);
        }
      }
      else {
        colors[currentGuessNumber][i] = Colors.grey;
      }
    }

    guesses.add(guess);

    if (actualWord == guess) {
      print("correct guess");
    }
    else {
      print("incorrect guess");
    }
  }
}