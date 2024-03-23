import 'package:buy_and_dot/feature/auth/domain/repo/auth_repo.dart';
import 'package:buy_and_dot/feature/settings/presintation/custom_bottom_sheet.dart';
import 'package:buy_and_dot/core/presentation/widget/app_bar/custom_app_bar.dart';

import 'package:buy_and_dot/feature/auth/presentation/sign_in_page.dart';
import 'package:buy_and_dot/feature/auth/presentation/sign_up_page.dart';
import 'package:buy_and_dot/theme/collections/color_collection.dart/color_manager.dart';
import 'package:flutter/material.dart';

import '../../../core/domain/intl/generated/l10n.dart';

class AuthScreen extends StatefulWidget {
  final AuthRepo authRepo;
  const AuthScreen({super.key, required this.authRepo});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  double get screenHeight => MediaQuery.of(context).size.height;
  double get screenWidth => MediaQuery.of(context).size.width;

  TextTheme get theme => Theme.of(context).textTheme;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: CustomAppBar(
          onTapAction: () {
            showModalBottomSheet(
                backgroundColor: ColorCollection.surfaceContainerLow,
                showDragHandle: true,
                enableDrag: false,
                context: context,
                builder: (context) => const CustomBottomSheet());
          },
          bottom: TabBar(
            unselectedLabelColor: ColorCollection.onSurfaceVar,
            labelColor: ColorCollection.primary,
            labelStyle: theme.titleSmall,
            unselectedLabelStyle: theme.titleSmall,
            tabs: [
              Tab(
                text: S.of(context).logIn,
              ),
              Tab(
                text: S.of(context).signUp,
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SignInPage(
              authRepo: widget.authRepo,
            ),
            SignUpPage(
              authRepo: widget.authRepo,
            ),
          ],
        ),
      ),
    );
  }
}
