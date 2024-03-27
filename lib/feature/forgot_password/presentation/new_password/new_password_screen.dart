import 'package:buy_and_dot/core/domain/intl/generated/l10n.dart';
import 'package:buy_and_dot/core/domain/router/router.dart';
import 'package:buy_and_dot/core/presentation/widget/app_bar/custom_app_bar.dart';
import 'package:buy_and_dot/core/presentation/widget/button/my_filled_button.dart';
import 'package:buy_and_dot/core/presentation/widget/field/my_text_field.dart';
import 'package:buy_and_dot/feature/forgot_password/presentation/forgot_password_view_model.dart';
import 'package:buy_and_dot/theme/collections/color_collection.dart/color_manager.dart';
import 'package:buy_and_dot/theme/collections/svg_collection/svg_collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewPasswordScreen extends StatefulWidget {
  final ForgotPasswordViewModel _viewModel;
  const NewPasswordScreen(
      {super.key, required ForgotPasswordViewModel viewModel})
      : _viewModel = viewModel;

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  ForgotPasswordViewModel get _viewModel => widget._viewModel;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context: context,
        title: Text(S.of(context).newPassword),
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
                        await _viewModel.checkNewPassword(
                            password: textEditingControllerPassword.text,
                            newPassword: textEditingControllerNewPassword.text);
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
