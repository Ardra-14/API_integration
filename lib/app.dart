import 'package:flutter/material.dart';
import 'package:my_app/home_page.dart';
import 'package:my_app/home_page2.dart';
import 'package:my_app/home_page3.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title : 'My App',
      // home : HomePage(),
      // home : HomePage2(),
      home : HomePage3(),
    );
  }
}