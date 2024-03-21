import 'package:buy_and_dot/core/presentation/widget/icon_button/standard_icon_button.dart';
import 'package:buy_and_dot/theme/collections/svg_collection/svg_collection.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  final Widget? title;
  final Widget? leading;
  final void Function()? onTapAction;
  final void Function()? onTapLeading;
  final PreferredSizeWidget? bottom;

  CustomAppBar({
    super.key,
    this.onTapLeading,
    this.onTapAction,
    this.title,
    this.leading,
    this.bottom,
  }) : super(
            bottom: bottom,
            title: Align(alignment: Alignment.centerLeft, child: title),
            leading: leading ??
                Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                    child: MyStandardIconButton(
                      iconFromCollection: SvgCollection.arrow_back,
                      onTap: () {
                        onTapLeading;
                      },
                      isSvgIcon: true,
                    )),
            actions: [
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                  child: MyStandardIconButton(
                    iconFromCollection: SvgCollection.trailing,
                    onTap: onTapAction ?? () {},
                    isSvgIcon: true,
                  )),
            ]);
}
