import 'package:buy_and_dot/core/domain/intl/generated/l10n.dart';
import 'package:buy_and_dot/core/presentation/widget/field/app_bar_text_field.dart';
import 'package:buy_and_dot/core/presentation/widget/icon_button/standard_icon_button.dart';
import 'package:buy_and_dot/feature/main_filter/presentation/page/main_bottom_sheet.dart';
import 'package:buy_and_dot/theme/collections/color_collection.dart/color_manager.dart';
import 'package:buy_and_dot/theme/collections/svg_collection/svg_collection.dart';
import 'package:flutter/material.dart';

class MainAppBar extends AppBar {
  final void Function()? onPressedIcon;
  final bool isMainScreen;
  final TextEditingController textEditingController;

  MainAppBar({
    this.onPressedIcon,
    required this.textEditingController,
    super.key,
    this.isMainScreen = true,
    required BuildContext context,
  }) : super(
            bottom: isMainScreen ? TabBar(
              dividerColor: ColorCollection.surfaceContainer,
              unselectedLabelColor: ColorCollection.onSurfaceVar,
              labelColor: ColorCollection.primary,
              labelStyle: Theme.of(context).textTheme.titleSmall,
              unselectedLabelStyle: Theme.of(context).textTheme.titleSmall,
              tabs: [
                Tab(
                  text: S.of(context).all,
                ),
                Tab(
                  text: S.of(context).my,
                ),
              ],
            ) : null,
            title: MyTextField(
              onPressed: onPressedIcon,
              isMainScreen: isMainScreen,
              textEditingController: textEditingController,
            ),
            automaticallyImplyLeading: false,
            actions: [
              MyStandardIconButton(
                backgroundColor: ColorCollection.surfaceContainerHight,
                iconFromCollection: SvgCollection.settings,
                onTap: () => showModalBottomSheet(
                    useRootNavigator: true,
                    backgroundColor: ColorCollection.surfaceContainerLow,
                    showDragHandle: true,
                    enableDrag: false,
                    context: context,
                    builder: (context) => const MainBottomSheet()),
                isSvgIcon: true,
              ),
            ]);
}
