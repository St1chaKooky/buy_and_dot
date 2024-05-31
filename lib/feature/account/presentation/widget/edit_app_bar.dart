import 'package:buy_and_dot/core/domain/intl/generated/l10n.dart';
import 'package:buy_and_dot/core/presentation/widget/icon_button/standard_icon_button.dart';
import 'package:buy_and_dot/theme/collections/svg_collection/svg_collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EditAccountAppBar extends AppBar {
  EditAccountAppBar({
    super.key,
    required BuildContext context,
  }) : super(
    title: Text(S.of(context).editAccount,style: Theme.of(context).textTheme.titleLarge),
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