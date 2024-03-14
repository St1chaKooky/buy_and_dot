import 'package:buy_and_dot/theme/collections/color_collection.dart/color_manager.dart';
import 'package:flutter/material.dart';

class MyFilledButton extends StatelessWidget {
  final bool isActive;
  final void Function() onTap;
  final String text;

  const MyFilledButton(
      {super.key,
      required this.onTap,
      required this.text,
      required this.isActive});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shadowColor: Colors.amber.withOpacity(0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100.0),
              ),
              elevation: 0.0,
              foregroundColor: isActive
                  ? ColorCollection.onPrimary
                  : ColorCollection.onSurface.withOpacity(0.4),
              backgroundColor: isActive
                  ? ColorCollection.primary
                  : ColorCollection.onSurface.withOpacity(0.12),
            ),
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 18),
              child: Text(
                text,
              ),
            )));
  }
}
