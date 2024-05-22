import 'package:buy_and_dot/core/domain/router/router.dart';
import 'package:buy_and_dot/core/presentation/widget/app_bar/main_app_bar.dart';
import 'package:buy_and_dot/feature/advertisement/presentation/page/all_advertisement/advertisement_list_page.dart';
import 'package:buy_and_dot/feature/advertisement/presentation/page/all_advertisement/advertisement_list_view_model.dart';
import 'package:buy_and_dot/feature/advertisement/presentation/page/my_advertisement/my_advertisement_list_page.dart';
import 'package:buy_and_dot/feature/advertisement/presentation/widget/navigation_drawer_widget.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AdvertisementScreen extends StatefulWidget {
  final AdvertisementListViewModel _viewModel;
  const AdvertisementScreen(
      {super.key, required AdvertisementListViewModel viewModel})
      : _viewModel = viewModel;

  @override
  State<AdvertisementScreen> createState() => _AdvertisementScreenState();
}

class _AdvertisementScreenState extends State<AdvertisementScreen> {
  TextEditingController textFieldEditingController = TextEditingController();
  AdvertisementListViewModel get _viewModel => widget._viewModel;

  TextTheme get theme => Theme.of(context).textTheme;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: NavigationDrawerWidget(),
        floatingActionButton: FloatingActionButton.small(
          child: const Icon(Icons.add),
          onPressed: 
          () => context.push(RouteList.addAdvertisement),
        ),
        appBar: MainAppBar(
          textEditingController: textFieldEditingController,
          context: context,
        ),
        body: TabBarView(
          children: [
            AdvertisementListPage(
              viewModel: _viewModel,
            ),
            MyAdvertisementListPage(
              viewModel: _viewModel,
            ),
          ],
        ),
      ),
    );
  }
}
