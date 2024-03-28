import 'package:buy_and_dot/feature/advertisement/presentation/page/advertisement_list_view_model.dart';
import 'package:buy_and_dot/feature/advertisement/presentation/widget/advertisement_list_item_widget.dart';
import 'package:flutter/material.dart';

class AdvertisementListPage extends StatefulWidget {
  final AdvertisementListViewModel _viewModel;
  const AdvertisementListPage(
      {super.key, required AdvertisementListViewModel viewModel})
      : _viewModel = viewModel;

  @override
  State<AdvertisementListPage> createState() => _AdvertisementListPageState();
}

class _AdvertisementListPageState extends State<AdvertisementListPage> {
  AdvertisementListViewModel get _viewModelMain => widget._viewModel;

  @override
  void initState() {
    super.initState();
    _viewModelMain.getAdvPage(0);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _viewModelMain.advertisementList,
      builder: (context, value, child) => ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 15).copyWith(top: 16),
        itemBuilder: (context, index) => AdvertisementListItemWidget(
            advertisementListItem:
                _viewModelMain.advertisementList.value[index]),
        separatorBuilder: (context, index) => const SizedBox(height: 8),
        itemCount: _viewModelMain.advertisementList.value.length,
      ),
    );
  }
}
