import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutterapp/login/login_page.dart';
import 'package:flutterapp/login/splash_screen.dart';

const Color myCustomColor = Color(0xCFEAFF);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Screen Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      routes: {
        '/login': (context) => LoginPage(),
      },
    );
  }
}
//main.dart