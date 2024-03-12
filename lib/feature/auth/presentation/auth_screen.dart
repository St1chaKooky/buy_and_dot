import 'package:buy_and_dot/feature/auth/sign_in/presentation/sign_in_page.dart';
import 'package:buy_and_dot/feature/auth/sign_up/presentation/sign_up_page.dart';
import 'package:buy_and_dot/theme/collections/svg_collection/svg_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                width: 24,
                height: 24,
                fit: BoxFit.scaleDown,
                SvgCollection.arrow_back,
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
              child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  width: 24,
                  height: 24,
                  fit: BoxFit.scaleDown,
                  SvgCollection.trailing,
                ),
              ),
            ),
          ],
          centerTitle: true,
          elevation: 0,
          bottom: const TabBar(
            tabs: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 14),
                child: Text('Вход'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 14),
                child: Text('Регистрация'),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            SignInPage(),
            SignUpPage(),
          ],
        ),
      ),
    );
  }
}
