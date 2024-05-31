
import 'package:buy_and_dot/theme/collections/color_collection.dart/color_manager.dart';

import 'package:flutter/material.dart';

class AccountTextField extends StatefulWidget {
  final String labelText;
  final TextEditingController textEditingController;
  const AccountTextField(
      {super.key,

      required this.textEditingController, required this.labelText,});

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
          labelText: widget.labelText,
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
          labelStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(color: ColorCollection.onSurfaceVar ),
          floatingLabelStyle:
              theme.bodyLarge!.copyWith(color: ColorCollection.onSurfaceVar),
          contentPadding:
              const EdgeInsets.only( top: 16, bottom: 16, left: 16),

          border: const OutlineInputBorder()),
    );
  }
}
