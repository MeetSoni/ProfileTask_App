import 'package:Task_App/home.dart';
import 'package:Task_App/splashscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'splash',
      routes: {
        'home': (context) => MyHome(),
        'splash': (context) => MyApp(),
      }));
}
