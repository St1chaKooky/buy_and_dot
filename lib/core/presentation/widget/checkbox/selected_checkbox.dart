import 'package:buy_and_dot/theme/collections/color_collection.dart/color_manager.dart';
import 'package:flutter/material.dart';

// Для чего виджет описан как Stateful?
class MySelectedCheckbox extends StatefulWidget {
  final bool? value;
  final void Function(bool?)? onTapCheckbox;

  const MySelectedCheckbox({
    super.key,
    required this.value,
    required this.onTapCheckbox,
  });

  @override
  State<MySelectedCheckbox> createState() => _MySelectedCheckboxState();
}

class _MySelectedCheckboxState extends State<MySelectedCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(
        value: widget.value,
        onChanged: widget.onTapCheckbox,
        activeColor: ColorCollection.primary,
        side: const BorderSide(width: 2, color: ColorCollection.outline)
        // Default to grey
        );
  }
}
