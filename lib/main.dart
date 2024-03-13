import 'package:buy_and_dot/core/domain/router/router.dart';
import 'package:buy_and_dot/theme/themes/themeData.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Buy And Dot',
      theme: themeData,
      routerConfig: router,
    );
  }
}
