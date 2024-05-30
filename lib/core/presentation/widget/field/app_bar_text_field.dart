
import 'package:buy_and_dot/core/domain/intl/generated/l10n.dart';
import 'package:buy_and_dot/core/presentation/widget/icon/svg_custom_icon.dart';
import 'package:buy_and_dot/theme/collections/color_collection.dart/color_manager.dart';
import 'package:buy_and_dot/theme/collections/svg_collection/svg_collection.dart';
import 'package:flutter/material.dart';

class MyAppBarTextField extends StatefulWidget {
  final void Function()? onPressed;
  final bool isMainScreen;

  final TextEditingController textEditingController;
  const MyAppBarTextField({
    this.onPressed,
    this.isMainScreen = true,
    super.key,
    required this.textEditingController,
  });

  @override
  State<MyAppBarTextField> createState() => _MyAppBarTextFieldState();
}

class _MyAppBarTextFieldState extends State<MyAppBarTextField> {
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
            prefixIcon: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: widget.isMainScreen
                      ? IconButton(
                          padding: EdgeInsets.zero,
                          icon: const CustomIconSvg(
                            assetName: SvgCollection.menu,
                          ),
                          onPressed: () => Scaffold.of(context).openDrawer(),
                        )
                      : const CustomIconSvg(
                          assetName: SvgCollection.search,
                        ),
                )),
            border: const OutlineInputBorder()),
      ),
    );
  }
}
