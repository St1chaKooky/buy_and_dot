import 'package:buy_and_dot/theme/collections/color_collection.dart/color_manager.dart';
import 'package:flutter/material.dart';

class MyTextButton extends StatefulWidget {
  final void Function() onTapButton;
  final String textButton;

  const MyTextButton({
    super.key,
    required this.onTapButton,
    required this.textButton,
  });

  @override
  State<MyTextButton> createState() => _MyTextButtonState();
}

class _MyTextButtonState extends State<MyTextButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: TextButton(
            style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0),
                ),
                elevation: 0.0,
                foregroundColor: ColorCollection.primary),
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 18),
              child: Text(
                widget.textButton,
              ),
            )));
  }
}
