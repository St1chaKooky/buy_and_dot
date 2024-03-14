import 'package:buy_and_dot/core/domain/router/router.dart';
import 'package:buy_and_dot/theme/collections/color_collection.dart/color_manager.dart';
import 'package:buy_and_dot/theme/collections/png_collection/png_collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      context.go(RouteList.auth);
    });
  }

  double get screenHeight => MediaQuery.of(context).size.height;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: screenHeight / 2.51,
        ),
        const Image(image: AssetImage(PngCollection.logo)),
        Container(
          height: screenHeight / 3.53,
        ),
        const SizedBox(
          height: 48,
          width: 48,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: ColorCollection.primary,
          ),
        ),
      ],
    ));
  }
}
