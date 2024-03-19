import 'package:buy_and_dot/core/domain/intl/generated/l10n.dart';
import 'package:buy_and_dot/core/domain/router/router.dart';
import 'package:buy_and_dot/core/presentation/widget/button/filled_button.dart';
import 'package:buy_and_dot/core/presentation/widget/button/text_button.dart';
import 'package:buy_and_dot/core/presentation/widget/field/my_text_field.dart';
import 'package:buy_and_dot/theme/collections/svg_collection/svg_collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  double get screenHeight => MediaQuery.of(context).size.height;
  final TextEditingController textEditingControllerPhone =
      TextEditingController();
  final TextEditingController textEditingControllerLock =
      TextEditingController();
  final isCorrectAuth = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    textEditingControllerPhone.addListener(_isCheckedListener);
    textEditingControllerLock.addListener(_isCheckedListener);
  }

  @override
  void dispose() {
    super.dispose();
    isCorrectAuth.removeListener(_isCheckedListener);
    textEditingControllerPhone.removeListener(_isCheckedListener);
    textEditingControllerLock.removeListener(_isCheckedListener);
  }

  void _isCheckedListener() {
    if (textEditingControllerPhone.text.isEmpty ||
        textEditingControllerLock.text.isEmpty) {
      isCorrectAuth.value = false;
      return;
    }
    isCorrectAuth.value = true;
    return;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(
            height: screenHeight / 8.44,
          ),
          MyTextField(
            isSvgIcon: true,
            textEditingController: textEditingControllerPhone,
            labelText: S.of(context).phone,
            assetName: SvgCollection.phone,
          ),
          const SizedBox(height: 20.0),
          MyTextField(
            isSvgIcon: true,
            textEditingController: textEditingControllerLock,
            labelText: S.of(context).password,
            isPassword: true,
            assetName: SvgCollection.lock,
          ),
          const SizedBox(height: 20.0),
          ValueListenableBuilder(
            valueListenable: isCorrectAuth,
            builder: (context, value, child) => MyFilledButton(
              onTap: isCorrectAuth.value ? () {} : null,
              text: S.of(context).toComeIn,
            ),
          ),
          const SizedBox(height: 20.0),
          MyTextButton(
            onTap: () {
              context.go(RouteList.forgotPassword);
            },
            text: S.of(context).forgotPassword,
          )
        ],
      ),
    );
  }
}
