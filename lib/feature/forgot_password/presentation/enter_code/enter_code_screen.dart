import 'package:buy_and_dot/core/domain/intl/generated/l10n.dart';
import 'package:buy_and_dot/core/domain/router/router.dart';
import 'package:buy_and_dot/core/presentation/widget/app_bar/custom_app_bar.dart';
import 'package:buy_and_dot/core/presentation/widget/button/filled_button.dart';
import 'package:buy_and_dot/core/presentation/widget/button/text_button.dart';
import 'package:buy_and_dot/theme/collections/color_collection.dart/color_manager.dart';
import 'package:buy_and_dot/theme/themes/themePininput.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

class EnterCodeScreen extends StatefulWidget {
  const EnterCodeScreen({super.key});

  @override
  State<EnterCodeScreen> createState() => _EnterCodeScreenState();
}

class _EnterCodeScreenState extends State<EnterCodeScreen> {
  double get screenHeight => MediaQuery.of(context).size.height;
  final TextEditingController textEditingControllerCode =
      TextEditingController();
  TextTheme get theme => Theme.of(context).textTheme;

  final isCorrectPhoneNumber = ValueNotifier(false);
  @override
  void initState() {
    super.initState();
    textEditingControllerCode.addListener(_isCheckedListener);
  }

  @override
  void dispose() {
    super.dispose();
    isCorrectPhoneNumber.removeListener(_isCheckedListener);
    textEditingControllerCode.removeListener(_isCheckedListener);
  }

  void _isCheckedListener() {
    if (textEditingControllerCode.text.length != 4) {
      isCorrectPhoneNumber.value = false;
      return;
    }
    isCorrectPhoneNumber.value = true;
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onTapTitle: () => context.pop(),
        leading: null,
        title: Align(
            alignment: Alignment.centerLeft,
            child: Text(S.of(context).enterACode)),
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
              '${S.of(context).enterTheCodeSentTo} +373 777 88 999',
              style: theme.bodyMedium!
                  .copyWith(color: ColorCollection.onSurfaceVar),
              overflow: TextOverflow.fade,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              child: Pinput(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                controller: textEditingControllerCode,
                onSubmitted: (pin) {
                  print(pin);
                },
                length: 4,
                defaultPinTheme: pinTheme,
                focusedPinTheme: pinTheme.copyWith(
                    decoration: pinTheme.decoration!.copyWith(
                        border: Border.all(color: ColorCollection.primary))),
                onCompleted: (pin) => debugPrint(pin),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ValueListenableBuilder(
              valueListenable: isCorrectPhoneNumber,
              builder: (context, value, child) => MyFilledButton(
                onTap: isCorrectPhoneNumber.value
                    ? () {
                        context.go(RouteList.newPassword);
                      }
                    : null,
                text: S.of(context).confirm,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            MyTextButton(
              onTap: () {},
              text: S.of(context).resendCode,
            )
          ],
        ),
      ),
    );
  }
}
