import 'package:buy_and_dot/core/domain/intl/generated/l10n.dart';
import 'package:buy_and_dot/theme/collections/color_collection.dart/color_manager.dart';
import 'package:flutter/material.dart';

class TitleAdvertisementInput extends StatefulWidget {
  final TextEditingController textEditingController;
  const TitleAdvertisementInput({super.key, required this.textEditingController});

  @override
  State<TitleAdvertisementInput> createState() => _TitleAdvertisementInputState();
}

class _TitleAdvertisementInputState extends State<TitleAdvertisementInput> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextField(
        style: Theme.of(context).textTheme.headlineMedium,
        controller: widget.textEditingController,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.transparent,
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide
                  .none, // Убираем границу, оставляя только закругления

              borderRadius: BorderRadius.all(Radius.circular(28)),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(28)),
              borderSide: BorderSide.none,
            ),
            hintText: S.of(context).name,
            hintStyle: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(color: ColorCollection.onSurfaceVar),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
  
            border: const OutlineInputBorder()),
      ),
    );
  }
}