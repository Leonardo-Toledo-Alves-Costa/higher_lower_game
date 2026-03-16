import 'package:flutter/material.dart';
import 'package:higher_lower_frontend/screens/game_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Higher or Lower Game',
        home: GameScreen()
      ),
    );
  }
}
