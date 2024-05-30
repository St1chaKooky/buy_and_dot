import 'package:buy_and_dot/core/domain/router/router.dart';
import 'package:buy_and_dot/core/presentation/widget/icon_button/standard_icon_button.dart';
import 'package:buy_and_dot/theme/collections/svg_collection/svg_collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AccaountAppBar extends AppBar {
  AccaountAppBar({
    super.key,
    required BuildContext context,
  }) : super(
    actions: [
      MyStandardIconButton(
                      iconFromCollection: SvgCollection.edit,
                      onTap: () {
                        context.push(RouteList.editAccount);
                      },
                      isSvgIcon: true,
                    )
    ],
            leading: IconButton(
                onPressed:  () {},
                icon: 
                    const Icon(Icons.menu_outlined)),
            automaticallyImplyLeading: true,
            title: Text('Профиль', style: Theme.of(context).textTheme.titleLarge,));
}
