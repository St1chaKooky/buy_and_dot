import 'package:buy_and_dot/core/presentation/widget/app_bar/custom_app_bar.dart';
import 'package:buy_and_dot/feature/auth/presentation/sign_in_page.dart';
import 'package:buy_and_dot/feature/auth/presentation/sign_up_page.dart';
import 'package:buy_and_dot/theme/collections/color_collection.dart/color_manager.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  TextTheme get theme => Theme.of(context).textTheme;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: CustomAppBar(
          onTapAction: () {},
          bottom: TabBar(
            unselectedLabelColor: ColorCollection.onSurfaceVar,
            labelColor: ColorCollection.primary,
            labelStyle: theme.titleSmall,
            unselectedLabelStyle: theme.titleSmall,
            tabs: const [
              Tab(
                text: 'Вход',
              ),
              Tab(
                text: 'Регистрация',
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
