import 'package:flutter/material.dart';
import 'package:flutter_globo_fitness/screens/bmi_screen.dart';
import 'package:flutter_globo_fitness/screens/intro_screen.dart';

void main() {
  runApp(const GlobeApp());
}

class GlobeApp extends StatelessWidget {
  const GlobeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      routes: {
        '/bmi': (context) => const BmiScreen(),
      },
      initialRoute: '/',
      home: const IntroScreen(),
    );
  }
}
