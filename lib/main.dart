import 'package:flutter/material.dart';
import 'package:flutter_application/screen/score_board_screen/scoreboard_screen.dart';
import 'package:flutter_application/screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
    
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

