import 'package:buy_and_dot/theme/collections/color_collection.dart/color_manager.dart';
import 'package:flutter/material.dart';

class MyTextButton extends StatefulWidget {
  final double verticalPadding;
  final void Function() onTap;
  final String text;

  const MyTextButton({
    super.key,
    this.verticalPadding = 18,
    required this.onTap,
    required this.text,
  });

  @override
  State<MyTextButton> createState() => _MyTextButtonState();
}

class _MyTextButtonState extends State<MyTextButton> {
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
                foregroundColor: ColorCollection.primary),
            onPressed: widget.onTap,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: widget.verticalPadding),
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
