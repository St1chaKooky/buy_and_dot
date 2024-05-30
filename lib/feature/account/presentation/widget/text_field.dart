
import 'package:buy_and_dot/theme/collections/color_collection.dart/color_manager.dart';

import 'package:flutter/material.dart';

class AccountTextField extends StatefulWidget {
  final TextEditingController textEditingController;
  const AccountTextField(
      {super.key,

      required this.textEditingController,});

  @override
  State<AccountTextField> createState() => _AccountTextFieldState();
}

class _AccountTextFieldState extends State<AccountTextField> {
  TextTheme get theme => Theme.of(context).textTheme;
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: theme.bodyLarge,
      controller: widget.textEditingController,
      decoration: InputDecoration(
          
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
          labelStyle: Theme.of(context).textTheme.bodyLarge,
          floatingLabelStyle:
              theme.bodyLarge!.copyWith(color: ColorCollection.primary),
          contentPadding:
              const EdgeInsets.only(left: 48, top: 16, bottom: 16, right: 16),
          prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              ),
          border: const OutlineInputBorder()),
    );
  }
}
