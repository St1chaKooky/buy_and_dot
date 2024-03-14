import 'package:buy_and_dot/core/domain/router/router.dart';
import 'package:buy_and_dot/core/presentation/widget/buttons/button_field.dart';
import 'package:buy_and_dot/core/presentation/widget/buttons/button_text.dart';
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
  bool _isButtonActive = false;

  @override
  void initState() {
    super.initState();
    textEditingControllerPhone.addListener(() {
      _updateButtonState();
    });
    textEditingControllerLock.addListener(() {
      _updateButtonState();
    });
  }

  void _updateButtonState() {
    setState(() {
      _isButtonActive = textEditingControllerPhone.text.isNotEmpty ||
          textEditingControllerLock.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: 16, vertical: screenHeight / 8.44),
      child: SingleChildScrollView(
        child: Column(
          children: [
            MyTextField(
              isSvgIcon: true,
              textEditingController: textEditingControllerPhone,
              labelText: 'Телефон',
              assetName: SvgCollection.phone,
            ),
            const SizedBox(height: 20.0),
            MyTextField(
              isSvgIcon: true,
              textEditingController: textEditingControllerLock,
              labelText: 'Пароль',
              isPassword: true,
              assetName: SvgCollection.lock,
            ),
            const SizedBox(height: 20.0),
            MyFilledButton(
              isActive: _isButtonActive,
              onTap: () {},
              text: 'Войти',
            ),
            const SizedBox(height: 20.0),
            MyTextButton(
              onTap: () {
                context.go(RouteList.forgotPassword);
              },
              text: 'Забыли пароль?',
            )
          ],
        ),
      ),
    );
  }
}
