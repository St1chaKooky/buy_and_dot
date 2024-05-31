import 'package:buy_and_dot/core/domain/intl/generated/l10n.dart';
import 'package:buy_and_dot/core/domain/router/router.dart';
import 'package:buy_and_dot/core/presentation/widget/icon/svg_custom_icon.dart';
import 'package:buy_and_dot/feature/settings/presintation/custom_bottom_sheet.dart';
import 'package:buy_and_dot/theme/collections/color_collection.dart/color_manager.dart';
import 'package:buy_and_dot/theme/collections/svg_collection/svg_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class NavigationDrawerWidget extends StatefulWidget {
  const NavigationDrawerWidget({super.key});

  @override
  State<NavigationDrawerWidget> createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorCollection.surfaceContainerLow,
      child: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          SvgPicture.asset(SvgCollection.headline),
          _itemBuilder(
            text: S.of(context).settings,
            icon: SvgCollection.settings,
            onTap: () {
              context.pop();

              showModalBottomSheet(
                  useRootNavigator: true,
                  backgroundColor: ColorCollection.surfaceContainerLow,
                  showDragHandle: true,
                  enableDrag: false,
                  context: context,
                  builder: (context) => const CustomBottomSheet());
            },
          ),
          _itemBuilder(
              text: S.of(context).aboutTheApplication,
              icon: SvgCollection.signal,
              onTap: () {
                context.push(RouteList.aboutApp);
              }),
          _itemBuilder(
            text: S.of(context).logOut,
              icon: SvgCollection.goOut,
              onTap: () {
                context.pop();
              }),
        ],
      ),
    );
  }

  Widget _itemBuilder(
          {required String text,
          required String icon,
          required void Function()? onTap}) =>
      InkWell(
        onTap: onTap,
        child: ListTile(
          leading: CustomIconSvg(assetName: icon),
          title: Text(text),
          titleTextStyle: Theme.of(context).textTheme.labelLarge,
        ),
      );
}
