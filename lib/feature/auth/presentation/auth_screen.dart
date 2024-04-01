import 'package:buy_and_dot/core/presentation/widget/app_bar/custom_app_bar.dart';
import 'package:buy_and_dot/feature/auth/presentation/auth_view_model.dart';

import 'package:buy_and_dot/feature/auth/presentation/sign_in_page.dart';
import 'package:buy_and_dot/feature/auth/presentation/sign_up_page.dart';
import 'package:buy_and_dot/theme/collections/color_collection.dart/color_manager.dart';
import 'package:flutter/material.dart';

import '../../../core/domain/intl/generated/l10n.dart';

class AuthScreen extends StatefulWidget {
  final AuthViewModel _viewModel;
  const AuthScreen({super.key, required AuthViewModel viewModel})
      : _viewModel = viewModel;

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  TextTheme get theme => Theme.of(context).textTheme;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: CustomAppBar(
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
          context: context,
        ),
        body: TabBarView(
          children: [
            SignInTab(
              viewModel: widget._viewModel,
            ),
            SignUpTab(
              viewModel: widget._viewModel,
            ),
          ],
        ),
      ),
    );
  }
}
