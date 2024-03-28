import 'package:buy_and_dot/core/domain/intl/generated/l10n.dart';
import 'package:buy_and_dot/core/presentation/widget/icon/svg_custom_icon.dart';
import 'package:buy_and_dot/theme/collections/color_collection.dart/color_manager.dart';
import 'package:buy_and_dot/theme/collections/svg_collection/svg_collection.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final TextEditingController textEditingController;
  const MyTextField({
    super.key,
    required this.textEditingController,
  });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  TextTheme get theme => Theme.of(context).textTheme;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextField(
        style: theme.bodyLarge,
        controller: widget.textEditingController,
        decoration: InputDecoration(
            filled: true,
            fillColor: ColorCollection.surfaceContainerHight,
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide
                  .none, // Убираем границу, оставляя только закругления

              borderRadius: BorderRadius.all(Radius.circular(28)),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(28)),
              borderSide: BorderSide.none,
            ),
            hintText: S.of(context).searchPost,
            hintStyle: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: ColorCollection.onSurfaceVar),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
            prefixIcon: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: CustomIconSvg(
                  assetName: SvgCollection.search,
                )),
            border: const OutlineInputBorder()),
      ),
    );
  }
}
