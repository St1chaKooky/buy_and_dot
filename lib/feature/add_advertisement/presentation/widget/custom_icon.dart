import 'package:buy_and_dot/core/presentation/widget/icon/svg_custom_icon.dart';

import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  final String name;
  const CustomIcon({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 48,height: 48, child: CustomIconSvg(assetName: name),);
  }
}