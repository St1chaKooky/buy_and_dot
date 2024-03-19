import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomIconSvg extends StatelessWidget {
  final String assetName;
  const CustomIconSvg({super.key, required this.assetName});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
        width: 24, height: 24, assetName, fit: BoxFit.scaleDown);
  }
}
