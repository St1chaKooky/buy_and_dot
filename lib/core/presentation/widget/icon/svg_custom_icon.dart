import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomIconSvg extends StatelessWidget {
  final String assetName;
  final Color? color;

  const CustomIconSvg({super.key, required this.assetName, this.color});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
        width: 24, height: 24, assetName, fit: BoxFit.scaleDown);
  }
}
