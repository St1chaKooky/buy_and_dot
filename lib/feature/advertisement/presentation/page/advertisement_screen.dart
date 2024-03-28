import 'package:buy_and_dot/core/presentation/widget/app_bar/main_app_bar.dart';
import 'package:buy_and_dot/feature/advertisement/presentation/page/advertisement_list_page.dart';
import 'package:buy_and_dot/feature/advertisement/presentation/page/advertisement_list_view_model.dart';

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
  TextEditingController textFieldEditingController = TextEditingController();
  AdvertisementListViewModel get _viewModel => widget._viewModel;

  TextTheme get theme => Theme.of(context).textTheme;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: MainAppBar(
          textEditingController: textFieldEditingController,
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
