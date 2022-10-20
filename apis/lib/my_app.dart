import 'package:flutter/material.dart';
import 'package:apis/screens/homepage.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task4-APIs',
      theme: ThemeData(
        primarySwatch: Colors.blue,
            textTheme:
        Theme.of(context).textTheme.apply(
          bodyColor: Colors.white, //<-- SEE HERE
          displayColor: Colors.white, //<-- SEE HERE
        ),
      ),
      home: const MyHomePage(title: 'Task4-APIs-Homepage'),
    );
  }
}