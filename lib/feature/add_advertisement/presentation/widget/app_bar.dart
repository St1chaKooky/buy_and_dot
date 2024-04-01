import 'package:buy_and_dot/core/presentation/widget/icon_button/standard_icon_button.dart';
import 'package:buy_and_dot/theme/collections/svg_collection/svg_collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddAdvertisementAppBar extends AppBar {
  AddAdvertisementAppBar({
    super.key,
    required BuildContext context,
  }) : super(
            leading: IconButton(
                onPressed: context.pop,
                icon: const Icon(Icons.arrow_back_outlined)),
            automaticallyImplyLeading: true,
            actions: [
              MyStandardIconButton(
                iconFromCollection: SvgCollection.check,
                onTap: context.pop,
                isSvgIcon: true,
              ),
            ]);
}
