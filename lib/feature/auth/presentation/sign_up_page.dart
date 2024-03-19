import 'package:buy_and_dot/core/presentation/widget/button/filled_button.dart';
import 'package:buy_and_dot/core/presentation/widget/checkbox/selected_checkbox.dart';
import 'package:buy_and_dot/core/presentation/widget/field/my_text_field.dart';
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
  TextTheme get theme => Theme.of(context).textTheme;

  final TextEditingController textEditingControllerPhone =
      TextEditingController();
  final TextEditingController textEditingControllerLock =
      TextEditingController();
  final TextEditingController textEditingControllerLockRepeat =
      TextEditingController();

  final isChecked = ValueNotifier(false);
  final isCorrectAuth = ValueNotifier(false);
  @override
  void initState() {
    super.initState();
    isChecked.addListener(_isCheckedListener);
    textEditingControllerPhone.addListener(_isCheckedListener);
    textEditingControllerLock.addListener(_isCheckedListener);
    textEditingControllerLockRepeat.addListener(_isCheckedListener);
  }

  @override
  void dispose() {
    super.dispose();
    isChecked.removeListener(_isCheckedListener);
    textEditingControllerPhone.removeListener(_isCheckedListener);
    textEditingControllerLock.removeListener(_isCheckedListener);
    textEditingControllerLockRepeat.removeListener(_isCheckedListener);
  }

  void _isCheckedListener() {
    if (!isChecked.value) {
      isCorrectAuth.value = false;
      return;
    }
    if (textEditingControllerPhone.text.isEmpty ||
        textEditingControllerLock.text.isEmpty ||
        textEditingControllerLockRepeat.text.isEmpty) {
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
          MyTextField(
            isSvgIcon: true,
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
                child: ValueListenableBuilder(
                  valueListenable: isChecked,
                  builder: (context, value, child) => MySelectedCheckbox(
                    value: isChecked.value,
                    onTap: (value) => isChecked.value = value ?? false,
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: RichText(
                      text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Я согласен с ',
                                style: theme.bodyLarge!.copyWith(
                                    color: ColorCollection.onSurface)),
                            TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {},
                                text: 'Правилами и условиями использования ',
                                style: theme.bodyLarge!
                                    .copyWith(color: ColorCollection.primary)),
                          ]),
                    )),
              )
            ],
          ),
          const SizedBox(height: 20.0),
          ValueListenableBuilder(
            valueListenable: isCorrectAuth,
            builder: (context, value, child) => MyFilledButton(
              onTap: isCorrectAuth.value ? () {} : null,
              text: 'Зарегистрироваться',
            ),
          ),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
