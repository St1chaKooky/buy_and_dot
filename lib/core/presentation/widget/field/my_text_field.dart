import 'package:buy_and_dot/core/presentation/widget/icon/png_custom_icon.dart';
import 'package:buy_and_dot/core/presentation/widget/icon/svg_custom_icon.dart';
import 'package:buy_and_dot/theme/collections/color_collection.dart/color_manager.dart';
import 'package:buy_and_dot/theme/collections/svg_collection/svg_collection.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final bool isSvgIcon;
  final String assetName;
  final bool isPassword;
  final TextEditingController textEditingController;
  final String labelText;
  const MyTextField(
      {super.key,
      this.isPassword = false,
      required this.textEditingController,
      required this.labelText,
      required this.assetName,
      required this.isSvgIcon});

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  TextTheme get theme => Theme.of(context).textTheme;
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: theme.bodyLarge,
      obscureText: widget.isPassword ? _obscureText : false,
      controller: widget.textEditingController,
      decoration: InputDecoration(
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: widget.isSvgIcon
                      ? CustomIconSvg(
                          assetName: _obscureText
                              ? SvgCollection.eye_off
                              : SvgCollection.eye,
                        )
                      : CustomIconPng(
                          assetName: _obscureText
                              ? SvgCollection.eye_off
                              : SvgCollection.eye,
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
          labelStyle: Theme.of(context).textTheme.bodyLarge,
          floatingLabelStyle:
              theme.bodyLarge!.copyWith(color: ColorCollection.primary),
          contentPadding:
              const EdgeInsets.only(left: 48, top: 16, bottom: 16, right: 16),
          prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              child: widget.isSvgIcon
                  ? CustomIconSvg(
                      assetName: widget.assetName,
                    )
                  : CustomIconSvg(
                      assetName: widget.assetName,
                    )),
          border: const OutlineInputBorder()),
    );
  }
}
