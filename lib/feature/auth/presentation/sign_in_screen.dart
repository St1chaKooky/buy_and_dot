import 'package:flutter/material.dart';

class SignInSceen extends StatefulWidget {
  const SignInSceen({super.key});

  @override
  State<SignInSceen> createState() => _SignInSceenState();
}

class _SignInSceenState extends State<SignInSceen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Варафак'),
          bottom: const TabBar(
            tabs: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 14),
                child: Text('Вход'),
              ),
              Text('Регистрация'),
            ],
          ),
        ),
      ),
    );
  }
}
