import 'package:buy_and_dot/core/domain/intl/generated/l10n.dart';
import 'package:buy_and_dot/core/presentation/widget/app_bar/custom_app_bar.dart';
import 'package:buy_and_dot/feature/advertisement/presentation/page/advertisement_list_page.dart';
import 'package:buy_and_dot/feature/advertisement/presentation/page/advertisement_list_view_model.dart';

import 'package:buy_and_dot/theme/collections/color_collection.dart/color_manager.dart';
import 'package:flutter/material.dart';

class AdvertisementScreen extends StatefulWidget {
  final AdvertisementListViewModel _viewModel;
  const AdvertisementScreen(
      {super.key, required AdvertisementListViewModel viewModel})
      : _viewModel = viewModel;

  @override
  State<AdvertisementScreen> createState() => _AdvertisementScreenState();
}

class _AdvertisementScreenState extends State<AdvertisementScreen> {
  AdvertisementListViewModel get _viewModel => widget._viewModel;

  TextTheme get theme => Theme.of(context).textTheme;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: CustomAppBar(
          bottom: TabBar(
            dividerColor: ColorCollection.surfaceContainer,
            unselectedLabelColor: ColorCollection.onSurfaceVar,
            labelColor: ColorCollection.primary,
            labelStyle: theme.titleSmall,
            unselectedLabelStyle: theme.titleSmall,
            tabs: [
              Tab(
                text: S.of(context).all,
              ),
              Tab(
                text: S.of(context).my,
              ),
            ],
          ),
          context: context,
        ),
        body: TabBarView(
          children: [
            AdvertisementListPage(
              viewModel: _viewModel,
            ),
            Container(
              width: 10,
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
