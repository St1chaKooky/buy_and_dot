import 'package:buy_and_dot/theme/collections/color_collection.dart/color_manager.dart';
import 'package:flutter/material.dart';

class MyFilledButton extends StatefulWidget {
  final bool isActiveButton;
  final void Function() onTapButton;
  final String textButton;

  const MyFilledButton(
      {super.key,
      required this.onTapButton,
      required this.textButton,
      required this.isActiveButton});

  @override
  State<MyFilledButton> createState() => _MyFilledButtonState();
}

class _MyFilledButtonState extends State<MyFilledButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100.0),
              ),
              elevation: 0.0,
              foregroundColor: widget.isActiveButton
                  ? ColorCollection.onPrimary
                  : ColorCollection.onSurface.withOpacity(0.4),
              backgroundColor: widget.isActiveButton
                  ? ColorCollection.primary
                  : ColorCollection.onSurface.withOpacity(0.12),
            ),
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 18),
              child: Text(
                widget.textButton,
              ),
            )));
  }
}
