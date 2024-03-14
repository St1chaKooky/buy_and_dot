import 'package:buy_and_dot/theme/collections/color_collection.dart/color_manager.dart';
import 'package:flutter/material.dart';

class MySelectedCheckbox extends StatelessWidget {
  final bool? value;
  final void Function(bool?)? onTap;

  const MySelectedCheckbox({
    super.key,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Checkbox(
        value: value,
        onChanged: onTap,
        activeColor: ColorCollection.primary,
        side: const BorderSide(width: 2, color: ColorCollection.outline)
        // Default to grey
        );
  }
}
