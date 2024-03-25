import 'package:buy_and_dot/core/domain/intl/generated/l10n.dart';
import 'package:buy_and_dot/core/domain/router/router.dart';
import 'package:buy_and_dot/feature/settings/presintation/custom_bottom_sheet.dart';
import 'package:buy_and_dot/core/presentation/widget/app_bar/custom_app_bar.dart';
import 'package:buy_and_dot/core/presentation/widget/button/my_filled_button.dart';
import 'package:buy_and_dot/core/presentation/widget/field/my_text_field.dart';
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
      appBar: CustomAppBar(
        onTapAction: () {
          showModalBottomSheet(
              backgroundColor: ColorCollection.surfaceContainerLow,
              showDragHandle: true,
              enableDrag: false,
              context: context,
              builder: (context) => const CustomBottomSheet());
        },
        title: Text(
          S.of(context).passwordRecovery,
          style: theme.titleLarge!.copyWith(color: ColorCollection.onSurface),
        ),
        onTapLeading: () => context.pop(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(
              height: screenHeight / 8.44,
            ),
            Text(
              S.of(context).enterThePhoneTo,
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
              labelText: S.of(context).phone,
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
                text: S.of(context).send,
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
