import 'package:buy_and_dot/feature/auth/presentation/sign_in_screen.dart';
import 'package:buy_and_dot/feature/splash/presentation/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
    
      home: const SignInSceen(),
    );
  }
}

