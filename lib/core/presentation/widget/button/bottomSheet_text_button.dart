import 'package:buy_and_dot/theme/collections/color_collection.dart/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomSheetTextButton extends StatelessWidget {
  final String text;
  const BottomSheetTextButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: context.pop,
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: ColorCollection.primary,
            ),
      ),
    );
  }
}
