import 'dart:developer';

import 'package:buy_and_dot/core/domain/intl/generated/l10n.dart';
import 'package:buy_and_dot/core/domain/router/router.dart';
import 'package:buy_and_dot/core/domain/use_case_result/use_case_result.dart';
import 'package:buy_and_dot/feature/forgot_password/domain/entity/forgot_password_credentails.dart';
import 'package:buy_and_dot/feature/forgot_password/domain/repo/forgot_password_repo.dart';
import 'package:buy_and_dot/feature/settings/presintation/custom_bottom_sheet.dart';
import 'package:buy_and_dot/core/presentation/widget/app_bar/custom_app_bar.dart';
import 'package:buy_and_dot/core/presentation/widget/button/my_filled_button.dart';
import 'package:buy_and_dot/core/presentation/widget/field/my_text_field.dart';
import 'package:buy_and_dot/theme/collections/color_collection.dart/color_manager.dart';
import 'package:buy_and_dot/theme/collections/svg_collection/svg_collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewPasswordScreen extends StatefulWidget {
  final ForgotPasswordRepo _forgotPasswordRepo;

  const NewPasswordScreen(
      {super.key, required ForgotPasswordRepo forgotPasswordRepo})
      : _forgotPasswordRepo = forgotPasswordRepo;

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  double get screenHeight => MediaQuery.of(context).size.height;
  TextTheme get theme => Theme.of(context).textTheme;

  final TextEditingController textEditingControllerPassword =
      TextEditingController();
  final TextEditingController textEditingControllerNewPassword =
      TextEditingController();
  final isCorrectPassword = ValueNotifier(false);
  @override
  void initState() {
    super.initState();
    textEditingControllerPassword.addListener(_isCheckedListener);
    textEditingControllerNewPassword.addListener(_isCheckedListener);
  }

  @override
  void dispose() {
    super.dispose();
    isCorrectPassword.removeListener(_isCheckedListener);
    textEditingControllerPassword.removeListener(_isCheckedListener);
    textEditingControllerNewPassword.removeListener(_isCheckedListener);
  }

  void _isCheckedListener() {
    if (textEditingControllerPassword.text.isEmpty ||
        textEditingControllerNewPassword.text.isEmpty) {
      isCorrectPassword.value = false;
      return;
    }
    isCorrectPassword.value = true;
    return;
  }

  Future<void> checkNewPassword() async {
    final result = await widget._forgotPasswordRepo.checkNewPassword(
        password: textEditingControllerPassword.text,
        newPassword: textEditingControllerNewPassword.text);

    switch (result) {
      case GoodUseCaseResult<ForgotPasswordCredentials>(:final data):
        log(data.jvtToken);
        break;
      case BadUseCaseResult<ForgotPasswordCredentials>(:final errorList):
        for (final error in errorList) {
          log(error.code);
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onTapAction: () {
          showModalBottomSheet(
              backgroundColor: ColorCollection.surfaceContainerLow,
              showDragHandle: true,
              enableDrag: false,
              context: context,
              builder: (context) => const CustomBottomSheet());
        },
        title: Align(
            alignment: Alignment.centerLeft,
            child: Text(S.of(context).newPassword,
                style: theme.titleLarge!
                    .copyWith(color: ColorCollection.onSurface))),
        onTapLeading: () => context.pop(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: screenHeight / 8.44,
            ),
            Text(
              S.of(context).setANewPassword,
              style: theme.bodyMedium!
                  .copyWith(color: ColorCollection.onSurfaceVar),
              overflow: TextOverflow.fade,
            ),
            const SizedBox(
              height: 20,
            ),
            MyTextField(
              isPassword: true,
              isSvgIcon: true,
              textEditingController: textEditingControllerPassword,
              labelText: S.of(context).password,
              assetName: SvgCollection.phone,
            ),
            const SizedBox(
              height: 20,
            ),
            MyTextField(
              isPassword: true,
              isSvgIcon: true,
              textEditingController: textEditingControllerNewPassword,
              labelText: S.of(context).newPassword,
              assetName: SvgCollection.phone,
            ),
            const SizedBox(
              height: 20,
            ),
            ValueListenableBuilder(
              valueListenable: isCorrectPassword,
              builder: (context, value, child) => MyFilledButton(
                onTap: isCorrectPassword.value
                    ? () async {
                        await checkNewPassword();
                        context.go(RouteList.auth);
                      }
                    : null,
                text: S.of(context).saveNewPassword,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
