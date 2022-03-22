// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/guess/guess_manager.dart';
import 'package:untitled/pages/homepage.dart';
import 'keyboard/keyboard_manager.dart';

void main() {

  runApp(
      MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => KeyboardManager(),
        ),
        ChangeNotifierProvider(
          create: (_) => GuessManager(),
        ),
      ],
      child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
