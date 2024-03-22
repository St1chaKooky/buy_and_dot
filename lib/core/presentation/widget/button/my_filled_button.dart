import 'package:buy_and_dot/theme/collections/color_collection.dart/color_manager.dart';
import 'package:flutter/material.dart';

class MyFilledButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;

  const MyFilledButton({
    super.key,
    required this.onTap,
    required this.text,
  });

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
              disabledBackgroundColor:
                  ColorCollection.onSurface.withOpacity(0.12),
              backgroundColor: ColorCollection.primary,
            ),
            onPressed: onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 18),
              child: Text(
                text,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: onTap != null
                          ? ColorCollection.onPrimary
                          : ColorCollection.onSurface.withOpacity(0.38),
                    ),
              ),
            )));
  }
}