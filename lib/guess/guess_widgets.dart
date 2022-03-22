// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/guess/guess_manager.dart';
import 'package:untitled/keyboard/keyboard_manager.dart';

class GuessTile extends StatelessWidget {

  GuessTile({Key? key, this.value = ""}) : super(key: key);

  String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(5.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 3.0),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: SizedBox(
          width: 40.0,
          height: 40.0,
          child: Text(
            value,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32.0,
              color: Colors.white,
            ),
          ),
        ),
    );
  }
}

class GuessRow extends StatelessWidget {
  GuessRow({Key? key, this.guessValue = ""}) : super(key: key);

  String guessValue;

  List<GuessTile> guessTileList = [
    GuessTile(),
    GuessTile(),
    GuessTile(),
    GuessTile(),
    GuessTile(),
  ];

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: guessTileList,
    );
  }
}

class GuessArea extends StatelessWidget {
  GuessArea({Key? key}) : super(key: key);

  void fixPrevGuess(int rowNumber, List<String> prevGuesses) {
    if (prevGuesses.isNotEmpty) {
      GuessRow prevActiveRow = guessRowList[rowNumber-1];
      for (int i = 0; i < 5; i++) {
        prevActiveRow.guessTileList[i].value = prevGuesses[rowNumber-1][i];
      }
    }
  }

  void updateGuess(int rowNumber, String guess) {
    GuessRow activeRow = guessRowList[rowNumber];
    for (int i = 0; i < guess.length; i++) {
      activeRow.guessTileList[i].value = guess[i];
    }
  }

  List<GuessRow>guessRowList = [
    GuessRow(),
    GuessRow(),
    GuessRow(),
    GuessRow(),
    GuessRow(),
    GuessRow(),
  ];

  @override
  Widget build(BuildContext context) {

    updateGuess(Provider.of<GuessManager>(context).currentGuessNumber, Provider.of<KeyboardManager>(context).currentValue);
    fixPrevGuess(Provider.of<GuessManager>(context).currentGuessNumber, Provider.of<GuessManager>(context).guesses);

    return Column(
      children: guessRowList,
    );
  }
}

