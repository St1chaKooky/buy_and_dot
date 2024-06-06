
import 'package:buy_and_dot/core/domain/intl/generated/l10n.dart';
import 'package:buy_and_dot/core/presentation/widget/icon/svg_custom_icon.dart';
import 'package:buy_and_dot/theme/collections/color_collection.dart/color_manager.dart';
import 'package:buy_and_dot/theme/collections/svg_collection/svg_collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  /// Constructs an [ScaffoldWithNavBar].
  final bool showBottomBar;
  const ScaffoldWithNavBar({
    super.key,
    required this.navigationShell,
    this.showBottomBar = true,
  });

  final StatefulNavigationShell navigationShell;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: showBottomBar ? null :  BottomNavigationBar(
        
        backgroundColor: ColorCollection.surfaceContainer,
        selectedItemColor: ColorCollection.onSurface,
        unselectedLabelStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: ColorCollection.onSurfaceVar,
            ),
        selectedLabelStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: ColorCollection.onSurface,
              fontWeight: FontWeight.w600,
            ),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              activeIcon: const CustomIconSvg(
                assetName: SvgCollection.advertisementSelect,
              ),
              icon: const CustomIconSvg(assetName: SvgCollection.advertisement),
              label: S.of(context).advertisements),
          BottomNavigationBarItem(
              activeIcon:
                  const CustomIconSvg(assetName: SvgCollection.likeSelect),
              icon: const CustomIconSvg(assetName: SvgCollection.like),
              label: S.of(context).favorite),
          BottomNavigationBarItem(
            activeIcon:
                const CustomIconSvg(assetName: SvgCollection.accountSelect),
            icon: const Badge(
              label: Text('10'),
              child: CustomIconSvg(assetName: SvgCollection.account)),
            label: S.of(context).account,
          ),
        ],
        currentIndex: navigationShell.currentIndex,
        onTap: (int index) => _onTap(context, index),
      ),
    );
  }

  void _onTap(BuildContext context, int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
