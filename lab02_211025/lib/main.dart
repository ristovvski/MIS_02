import 'package:flutter/material.dart';
import 'package:lab02_211025/screens/jokes_type_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Joke Types 211025',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: JokesTypeScreen(),
    );
  }
}
