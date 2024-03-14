import 'package:buy_and_dot/theme/collections/color_collection.dart/color_manager.dart';
import 'package:flutter/material.dart';

// Для чего виджет описан как Stateful?
class MyFilledButton extends StatefulWidget {
  // Тк поля относятся к этой кнопке, приписка Button им ни к чему =)
  final bool isActive;
  final void Function() onTap;
  final String text;

  const MyFilledButton(
      {super.key,
      required this.onTap,
      required this.text,
      required this.isActive});

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
              shadowColor: Colors.amber.withOpacity(0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100.0),
              ),
              elevation: 0.0,
              foregroundColor: widget.isActive
                  ? ColorCollection.onPrimary
                  : ColorCollection.onSurface.withOpacity(0.4),
              backgroundColor: widget.isActive
                  ? ColorCollection.primary
                  : ColorCollection.onSurface.withOpacity(0.12),
            ),
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 18),
              child: Text(
                widget.text,
              ),
            )));
  }
}
