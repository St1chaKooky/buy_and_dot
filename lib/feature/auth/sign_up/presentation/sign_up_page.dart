import 'package:buy_and_dot/core/presentation/widget/buttons/button_field.dart';
import 'package:buy_and_dot/core/presentation/widget/checkbox/selected_checkbox.dart';
import 'package:buy_and_dot/core/presentation/widget/field/field.dart';
import 'package:buy_and_dot/theme/collections/color_collection.dart/color_manager.dart';
import 'package:buy_and_dot/theme/collections/svg_collection/svg_collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  double get screenHeight => MediaQuery.of(context).size.height;
  TextEditingController textEditingControllerPhone = TextEditingController();
  TextEditingController textEditingControllerLock = TextEditingController();
  TextEditingController textEditingControllerLockRepeat =
      TextEditingController();
  bool? isChecked = false;
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
    textEditingControllerLockRepeat.addListener(() {
      _updateButtonState();
    });
  }

  void _updateButtonState() {
    setState(() {
      _isButtonActive = textEditingControllerPhone.text.isNotEmpty ||
          textEditingControllerLock.text.isNotEmpty ||
          textEditingControllerLockRepeat.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: screenHeight / 8.44,
            ),
            MyField(
              textEditingController: textEditingControllerPhone,
              labelText: 'Телефон',
              assetName: SvgCollection.phone,
            ),
            const SizedBox(height: 20.0),
            MyField(
              textEditingController: textEditingControllerLock,
              labelText: 'Пароль',
              isPassword: true,
              assetName: SvgCollection.lock,
            ),
            const SizedBox(height: 20.0),
            MyField(
              textEditingController: textEditingControllerLockRepeat,
              labelText: 'Повторите пароль',
              isPassword: true,
              assetName: SvgCollection.lock,
            ),
            const SizedBox(height: 20.0),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 8, right: 12, bottom: 12, top: 12),
                  child: MySelectedCheckbox(
                    value: isChecked,
                    onTapCheckbox: (bool? value) =>
                        setState(() => isChecked = value),
                  ),
                ),
                Flexible(
                  child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: RichText(
                        text: TextSpan(
                            style: DefaultTextStyle.of(context).style,
                            children: <TextSpan>[
                              const TextSpan(text: 'Я согласен с '),
                              TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => print('textBt'),
                                  text: 'Правилами и условиями использования ',
                                  style: const TextStyle(
                                      color: ColorCollection.primary)),
                            ]),
                      )),
                )
              ],
            ),
            const SizedBox(height: 20.0),
            MyFilledButton(
              isActiveButton: _isButtonActive,
              onTapButton: () {},
              textButton: 'Зарегистрироваться',
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
