import 'package:buy_and_dot/theme/collections/color_collection.dart/color_manager.dart';
import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  final bool? value;
  final void Function(bool?)? onChanged;

  const CustomCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(
        value: widget.value,
        onChanged: widget.onChanged,
        activeColor: ColorCollection.primary,
        side: const BorderSide(width: 2, color: ColorCollection.outline)
        // Default to grey
        );
  }
}
