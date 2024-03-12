import 'package:buy_and_dot/theme/collections/color_collection.dart/color_manager.dart';
import 'package:buy_and_dot/theme/collections/svg_collection/svg_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyField extends StatefulWidget {
  final String assetName;
  final bool isPassword;
  final TextEditingController textEditingController;
  final String labelText;
  const MyField(
      {super.key,
      this.isPassword = false,
      required this.textEditingController,
      required this.labelText,
      required this.assetName});

  @override
  State<MyField> createState() => _MyFieldState();
}

class _MyFieldState extends State<MyField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.isPassword ? _obscureText : false,
      controller: widget.textEditingController,
      decoration: InputDecoration(
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: SvgPicture.asset(
                    width: 24,
                    height: 24,
                    fit: BoxFit.scaleDown,
                    _obscureText ? SvgCollection.eye_off : SvgCollection.eye,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : null,
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(
                color: ColorCollection.primary,
                width: 3), // Убираем границу, оставляя только закругления
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(
                color: ColorCollection.outline,
                width: 1), // Убираем границу, оставляя только закругления
          ),
          labelText: widget.labelText,
          contentPadding:
              const EdgeInsets.only(left: 48, top: 16, bottom: 16, right: 16),
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            child: SvgPicture.asset(
                width: 24, height: 24, widget.assetName, fit: BoxFit.scaleDown),
          ),
          border: const OutlineInputBorder()),
    );
  }
}
