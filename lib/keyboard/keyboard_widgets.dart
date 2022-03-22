// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/guess/guess_manager.dart';
import 'keyboard_manager.dart';

class LetterKey extends StatelessWidget {

  LetterKey({Key? key, required this.value}) : super(key: key);

  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(3.0),
      child: SizedBox(
        width: 30.0,
        height: 40.0,
        child: ElevatedButton(
          child: Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
          onPressed: () {
            Provider.of<KeyboardManager>(context, listen: false).updateValue(value);
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(0.0),
            primary: Colors.black,
          ),
        ),
      ),
    );
  }
}

class EnterKey extends StatelessWidget {

  EnterKey({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(3.0),
      child: SizedBox(
        width: 60.0,
        height: 40.0,
        child: ElevatedButton(
          child: Text(
            "Enter",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
          onPressed: () {

            if (Provider.of<KeyboardManager>(context, listen: false).currentValue.length == 5) {
              Provider.of<GuessManager>(context, listen: false).evaluateGuess(
                  Provider
                      .of<KeyboardManager>(context, listen: false)
                      .currentValue
              );
              Provider.of<GuessManager>(context, listen: false)
                  .updateGuessNumber();
              Provider.of<KeyboardManager>(context, listen: false).reset();
            }
          },

          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(0.0),
            primary: Colors.black,
          ),
        ),
      ),
    );
  }
}

class DeleteKey extends StatelessWidget {

  DeleteKey({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(3.0),
      child: SizedBox(
        width: 50.0,
        height: 40.0,
        child: ElevatedButton(
          child: Text(
            "Del",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
          onPressed: () {
            Provider.of<KeyboardManager>(context, listen: false).deleteLast();
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(0.0),
            primary: Colors.black,
          ),
        ),
      ),
    );
  }
}

class Keyboard extends StatelessWidget {
  const Keyboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LetterKey(value: "Q"),
              LetterKey(value: "W"),
              LetterKey(value: "E"),
              LetterKey(value: "R"),
              LetterKey(value: "T"),
              LetterKey(value: "Y"),
              LetterKey(value: "U"),
              LetterKey(value: "I"),
              LetterKey(value: "O"),
              LetterKey(value: "P"),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 20.0,
                height: 40.0,
              ),
              LetterKey(value: "A"),
              LetterKey(value: "S"),
              LetterKey(value: "D"),
              LetterKey(value: "F"),
              LetterKey(value: "G"),
              LetterKey(value: "H"),
              LetterKey(value: "J"),
              LetterKey(value: "K"),
              LetterKey(value: "L"),
            ],
          ),
          Row(
            children: [
              EnterKey(),
              LetterKey(value: "Z"),
              LetterKey(value: "X"),
              LetterKey(value: "C"),
              LetterKey(value: "V"),
              LetterKey(value: "B"),
              LetterKey(value: "N"),
              LetterKey(value: "M"),
              DeleteKey(),
            ],
          ),
        ],
      ),
    );
  }
}
