import 'package:buy_and_dot/theme/collections/color_collection.dart/color_manager.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InputChipWidget extends StatelessWidget {
  void Function() onTap;
  final String text;
   InputChipWidget({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(vertical: 6).copyWith(left: 12),
      width: 117,
      height: 32,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: 1,
          color: ColorCollection.outline,
        ),
      ),
      child: Center(
        child: Row(
          children: [
            Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(color: ColorCollection.onSurfaceVar),
            ),
            const SizedBox(width: 7),
            SizedBox(
              height: 18.0,
              width: 18.0,
              child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: onTap,
                  icon: const Icon(size: 18, Icons.close)),
            )
          ],
        ),
      ),
    );
  }
}
