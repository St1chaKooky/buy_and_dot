import 'package:buy_and_dot/core/presentation/widget/icon/png_custom_icon.dart';
import 'package:buy_and_dot/core/presentation/widget/icon/svg_custom_icon.dart';
import 'package:buy_and_dot/theme/collections/color_collection.dart/color_manager.dart';
import 'package:flutter/material.dart';

class MyStandardIconButton extends StatelessWidget {
  final Color? backgroundColor;
  final bool isSvgIcon;
  final String iconFromCollection;
  final void Function() onTap;
  const MyStandardIconButton(
      {super.key,
      required this.iconFromCollection,
      required this.onTap,
      required this.isSvgIcon,
      this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: SizedBox(
        width: 40,
        height: 40,
        child: IconButton(
            iconSize: 24,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(backgroundColor),
            ),
            color: ColorCollection.outline,
            onPressed: onTap,
            icon: isSvgIcon
                ? CustomIconSvg(
                    assetName: iconFromCollection,
                  )
                : CustomIconPng(
                    assetName: iconFromCollection,
                  )),
      ),
    );
  }
}
