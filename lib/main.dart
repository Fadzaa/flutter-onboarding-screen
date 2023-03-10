import 'package:flutter/material.dart';
import 'package:mymv2/GetStarted.dart';
import 'package:mymv2/MovieList.dart';
import 'package:mymv2/OnboardingScreen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: Colors.blue,
      ),
      home: OnboardingScreen()
    );
  }
}


