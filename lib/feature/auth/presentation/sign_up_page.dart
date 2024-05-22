
import 'package:buy_and_dot/core/domain/intl/generated/l10n.dart';
import 'package:buy_and_dot/core/domain/router/router.dart';
import 'package:buy_and_dot/core/presentation/widget/button/my_filled_button.dart';
import 'package:buy_and_dot/core/presentation/widget/checkbox/selected_checkbox.dart';
import 'package:buy_and_dot/core/presentation/widget/field/my_text_field.dart';
import 'package:buy_and_dot/feature/auth/presentation/auth_view_model.dart';
import 'package:buy_and_dot/theme/collections/color_collection.dart/color_manager.dart';
import 'package:buy_and_dot/theme/collections/svg_collection/svg_collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class SignUpTab extends StatefulWidget {
  final AuthViewModel _viewModel;

  const SignUpTab({super.key, required AuthViewModel viewModel})
      : _viewModel = viewModel;

  @override
  State<SignUpTab> createState() => _SignUpTabState();
}

class _SignUpTabState extends State<SignUpTab> {
  AuthViewModel get _viewModel => widget._viewModel;
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
          MyTextField(
            isSvgIcon: true,
            textEditingController: textEditingControllerLockRepeat,
            labelText: S.of(context).repeatPassword,
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
                                text: S.of(context).iAgreeWith,
                                style: theme.bodyLarge!.copyWith(
                                    color: ColorCollection.onSurface)),
                            TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {},
                                text: ' ${S.of(context).termsOfUse}',
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
              onTap: isCorrectAuth.value
                  ? () async {
                      await _viewModel.signUp(textEditingControllerPhone.text,
                          textEditingControllerLock.text);
                      context.go(RouteList.advertisement);
                    }
                  : null,
              text: S.of(context).toComeUp,
            ),
          ),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
