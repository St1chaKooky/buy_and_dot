import 'package:buy_and_dot/core/data/model/user_model.dart';
import 'package:buy_and_dot/core/domain/intl/generated/l10n.dart';
import 'package:buy_and_dot/core/domain/router/router.dart';
import 'package:buy_and_dot/core/presentation/widget/icon_button/standard_icon_button.dart';
import 'package:buy_and_dot/feature/settings/presintation/custom_bottom_sheet.dart';
import 'package:buy_and_dot/theme/collections/color_collection.dart/color_manager.dart';
import 'package:buy_and_dot/theme/collections/svg_collection/svg_collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AccaountAppBar extends AppBar {
  final UserModel userData;
  AccaountAppBar({
    super.key,
    required BuildContext context,
    required this.userData,

  }) : super(
    actions: [
      MyStandardIconButton(
                      iconFromCollection: SvgCollection.edit,
                      onTap: () {
                        context.push(RouteList.editAccount, extra: userData);
                      },
                      isSvgIcon: true,
                    )
    ],
            leading: IconButton(
                onPressed:  () => showModalBottomSheet(
                  useRootNavigator: true,
                    backgroundColor: ColorCollection.surfaceContainerLow,
                    showDragHandle: true,
                    enableDrag: false,
                    context: context,
                    builder: (context) => const CustomBottomSheet()),
                icon: 
                    const Icon(Icons.menu_outlined)),
            automaticallyImplyLeading: true,
            title: Text(S.of(context).account, style: Theme.of(context).textTheme.titleLarge,));
}
