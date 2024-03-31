import 'package:buy_and_dot/theme/collections/color_collection.dart/color_manager.dart';
import 'package:flutter/material.dart';

class BottomSheetTextField extends StatefulWidget {
  final TextEditingController textEditingController;
  final String labelText;
  const BottomSheetTextField({
    super.key,
    required this.textEditingController,
    required this.labelText,
  });

  @override
  State<BottomSheetTextField> createState() => _BottomSheetTextFieldState();
}

class _BottomSheetTextFieldState extends State<BottomSheetTextField> {
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
          labelText: widget.labelText,
          labelStyle: Theme.of(context).textTheme.bodyLarge,
          floatingLabelStyle:
              theme.bodyLarge!.copyWith(color: ColorCollection.primary),
          contentPadding:
              const EdgeInsets.only(left: 16, top: 16, bottom: 16, right: 16),
          border: const OutlineInputBorder()),
    );
  }
}
