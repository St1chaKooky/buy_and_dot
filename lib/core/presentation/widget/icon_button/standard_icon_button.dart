import 'package:buy_and_dot/core/presentation/widget/icon/custom_icon_png.dart';
import 'package:buy_and_dot/core/presentation/widget/icon/custom_icon_svg.dart';
import 'package:flutter/material.dart';

class MyStandardIconButton extends StatelessWidget {
  final bool isSvgIcon;
  final String iconFromCollection;
  final void Function() onTap;
  const MyStandardIconButton(
      {super.key,
      required this.iconFromCollection,
      required this.onTap,
      required this.isSvgIcon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 48,
      height: 48,
      child: IconButton(
          onPressed: onTap,
          icon: isSvgIcon
              ? CustomIconSvg(
                  assetName: iconFromCollection,
                )
              : CustomIconPng(
                  assetName: iconFromCollection,
                )),
    );
  }
}
