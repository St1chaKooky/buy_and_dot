import 'package:buy_and_dot/core/domain/router/router.dart';
import 'package:buy_and_dot/core/presentation/widget/buttons/button_field.dart';
import 'package:buy_and_dot/core/presentation/widget/field/my_text_field.dart';
import 'package:buy_and_dot/core/presentation/widget/icon_button/standard_icon_button.dart';
import 'package:buy_and_dot/theme/collections/color_collection.dart/color_manager.dart';
import 'package:buy_and_dot/theme/collections/svg_collection/svg_collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PasswordRecoveryScreen extends StatefulWidget {
  const PasswordRecoveryScreen({super.key});

  @override
  State<PasswordRecoveryScreen> createState() => _PasswordRecoveryScreenState();
}

class _PasswordRecoveryScreenState extends State<PasswordRecoveryScreen> {
  double get screenHeight => MediaQuery.of(context).size.height;
  TextTheme get theme => Theme.of(context).textTheme;

  final TextEditingController textEditingControllerPhone =
      TextEditingController();
  final isCorrectPhoneNumber = ValueNotifier(false);
  @override
  void initState() {
    super.initState();
    textEditingControllerPhone.addListener(_isCheckedListener);
  }

  @override
  void dispose() {
    super.dispose();
    isCorrectPhoneNumber.removeListener(_isCheckedListener);
    isCorrectPhoneNumber.removeListener(_isCheckedListener);
    textEditingControllerPhone.removeListener(_isCheckedListener);
  }

  void _isCheckedListener() {
    if (textEditingControllerPhone.text.isEmpty) {
      isCorrectPhoneNumber.value = false;
      return;
    }
    isCorrectPhoneNumber.value = true;
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Восстановление пароля',
              style:
                  theme.titleLarge!.copyWith(color: ColorCollection.onSurface),
            )),
        leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
            child: MyStandardIconButton(
              iconFromCollection: SvgCollection.arrow_back,
              onTap: () {
                context.pop();
              },
              isSvgIcon: true,
            )),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: screenHeight / 8.44,
              ),
              Text(
                'Введите номер телефона, на который будет отправлен код для сброса пароля',
                style: theme.bodyMedium!
                    .copyWith(color: ColorCollection.onSurfaceVar),
                overflow: TextOverflow.fade,
              ),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                isSvgIcon: true,
                textEditingController: textEditingControllerPhone,
                labelText: 'Телефон',
                assetName: SvgCollection.phone,
              ),
              const SizedBox(
                height: 20,
              ),
              ValueListenableBuilder(
                valueListenable: isCorrectPhoneNumber,
                builder: (context, value, child) => MyFilledButton(
                  onTap: isCorrectPhoneNumber.value
                      ? () {
                          context.go(RouteList.enterPassword);
                        }
                      : null,
                  text: 'Отправить',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
