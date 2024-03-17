import 'package:buy_and_dot/theme/collections/color_collection.dart/color_manager.dart';
import 'package:flutter/material.dart';

class MyFilledButton extends StatefulWidget {
  final void Function()? onTap;
  final String text;

  const MyFilledButton({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  State<MyFilledButton> createState() => _MyFilledButtonState();
}

class _MyFilledButtonState extends State<MyFilledButton> {
  TextTheme get theme => Theme.of(context).textTheme;

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
              foregroundColor: ColorCollection.onPrimary,
              backgroundColor: ColorCollection.primary,
            ),
            onPressed: widget.onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 18),
              child: Text(
                widget.text,
                style: const TextStyle(
                  fontFamily: 'Roboto-Medium',
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            )));
  }
}
