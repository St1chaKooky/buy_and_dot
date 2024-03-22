import 'package:buy_and_dot/theme/collections/color_collection.dart/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomSheetTextButton extends StatelessWidget {
  final String textName;
  const BottomSheetTextButton({super.key, required this.textName});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: context.pop,
      child: Text(
        textName,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: ColorCollection.primary,
            ),
      ),
    );
  }
}
