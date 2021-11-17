// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kcal_nutrition/constans.dart';
import 'splash.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return MaterialApp(
      title: 'Kcal App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: DEFAULT_WHITE,
      ),
      home: Splash(),
    );
  }
}
