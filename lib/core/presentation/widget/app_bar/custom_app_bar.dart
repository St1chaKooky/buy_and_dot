import 'package:buy_and_dot/core/presentation/widget/icon_button/standard_icon_button.dart';
import 'package:buy_and_dot/feature/settings/presintation/custom_bottom_sheet.dart';
import 'package:buy_and_dot/theme/collections/color_collection.dart/color_manager.dart';
import 'package:buy_and_dot/theme/collections/svg_collection/svg_collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends AppBar {
  @override
  final Widget? title;
  @override
  final Widget? leading;

  @override
  final PreferredSizeWidget? bottom;

  CustomAppBar({
    super.key,
    required BuildContext context,
    this.title,
    this.leading,
    this.bottom,
  }) : super(
            bottom: bottom,
            title: Align(alignment: Alignment.centerLeft, child: title),
            leading: leading ??
                (context.canPop()
                    ? IconButton(
                        onPressed: context.pop,
                        icon: const Icon(Icons.arrow_back_outlined))
                    : const SizedBox.shrink()),
            automaticallyImplyLeading: true,
            actions: [
              MyStandardIconButton(
                iconFromCollection: SvgCollection.settings,
                onTap: () => showModalBottomSheet(
                    backgroundColor: ColorCollection.surfaceContainerLow,
                    showDragHandle: true,
                    enableDrag: false,
                    context: context,
                    builder: (context) => const CustomBottomSheet()),
                isSvgIcon: true,
              ),
            ]);
}
