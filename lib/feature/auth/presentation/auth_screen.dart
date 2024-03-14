import 'package:buy_and_dot/core/presentation/widget/icon_button/standard_icon_button.dart';
import 'package:buy_and_dot/feature/auth/presentation/sign_in_page.dart';
import 'package:buy_and_dot/feature/auth/presentation/sign_up_page.dart';
import 'package:buy_and_dot/theme/collections/svg_collection/svg_collection.dart';
import 'package:flutter/material.dart';

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
              child: MyStandardIconButton(
                iconFromCollection: SvgCollection.arrow_back,
                onTap: () {},
                isSvgIcon: true,
              )),
          actions: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                child: MyStandardIconButton(
                  iconFromCollection: SvgCollection.trailing,
                  onTap: () {},
                  isSvgIcon: true,
                )),
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
