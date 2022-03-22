// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/keyboard/keyboard_manager.dart';
import '../guess/guess_manager.dart';
import '../guess/guess_widgets.dart';
import '../keyboard/keyboard_widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    print(Provider.of<KeyboardManager>(context).currentValue);
    print(Provider.of<KeyboardManager>(context).currentValue.length);
    print(Provider.of<GuessManager>(context).currentGuessNumber);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          "Wordle",
          style: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GuessArea(),
          Keyboard(),
        ],
      )
    );
  }
}
