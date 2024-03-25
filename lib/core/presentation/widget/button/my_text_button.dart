import 'package:buy_and_dot/theme/collections/color_collection.dart/color_manager.dart';
import 'package:flutter/material.dart';

class MyTextButton extends StatelessWidget {
  final bool maxWidth;
  final double verticalPadding;

  final void Function() onTap;
  final String text;

  const MyTextButton({
    super.key,
    this.maxWidth = true,
    this.verticalPadding = 18,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: maxWidth ? double.infinity : null,
        child: TextButton(
            style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: verticalPadding),
                shadowColor: Colors.amber.withOpacity(0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0),
                ),
                elevation: 0.0,
                backgroundColor: Colors.amber.withOpacity(0),
                foregroundColor: ColorCollection.primary),
            onPressed: onTap,
            child: Text(
              text,
              style: const TextStyle(
                fontFamily: 'Roboto-Medium',
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            )));
  }
}
