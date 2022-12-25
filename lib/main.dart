import 'package:flutter/material.dart';
import 'package:flutter_application_1/homepage.dart';
import 'package:flutter_application_1/login_screen.dart';
import 'package:flutter_application_1/signup_screen.dart';
import 'package:flutter_application_1/splash_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => SplashScreen(),
      '/login': (context) => LoginScreen(),
      '/register': (context) => SignUpScreen(),
      '/homepage': (context) => MyApp(),
    },
  ));
}
