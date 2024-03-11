import 'package:buy_and_dot/theme/color_collection.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  double get screenHeight => MediaQuery.of(context).size.height;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        
         Container(height: screenHeight/2.51,),
         const Image(image: AssetImage('assets/image/sign_in/logo.png')),
         Container(height: screenHeight/3.53,),

         const CircularProgressIndicator(
              strokeWidth: 2,
              color: ColorCollection.primary,
            ),
      ],)
    );
  }
}