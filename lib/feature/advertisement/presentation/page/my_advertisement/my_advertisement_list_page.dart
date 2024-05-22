
import 'package:buy_and_dot/core/domain/intl/generated/l10n.dart';
import 'package:buy_and_dot/feature/advertisement/presentation/page/all_advertisement/advertisement_list_view_model.dart';
import 'package:buy_and_dot/theme/collections/svg_collection/svg_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyAdvertisementListPage extends StatefulWidget {
  final AdvertisementListViewModel _viewModel;
  const MyAdvertisementListPage(
      {super.key, required AdvertisementListViewModel viewModel})
      : _viewModel = viewModel;

  @override
  State<MyAdvertisementListPage> createState() =>
      _MyAdvertisementListPageState();
}

class _MyAdvertisementListPageState extends State<MyAdvertisementListPage> {
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
        builder: (context, value, child) => _emptyPostsBuilder
        //Представим если список пришел пустой
        // _viewModelMain
        //         .advertisementList.value.isEmpty
        //     ? ListView.separated(
        //         padding:
        //             const EdgeInsets.symmetric(horizontal: 15).copyWith(top: 16),
        //         itemBuilder: (context, index) => AdvertisementListItemWidget(
        //             advertisementListItem:
        //                 _viewModelMain.advertisementList.value[index],
        //                isMineAdvertisement: true,
        // ),
        //         separatorBuilder: (context, index) => const SizedBox(height: 8),
        //         itemCount: _viewModelMain.advertisementList.value.length,
        //       )
        //     : Container(),
        );
  }

  Widget get _emptyPostsBuilder => Padding(
        padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 16),
        child: Column(
          children: [
            SvgPicture.asset(
                width: 120,
                height: 120,
                SvgCollection.add,
                fit: BoxFit.scaleDown),
            const SizedBox(height: 16),
            Text(
              S.of(context).notHaveAnyAds,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            Text(
              textAlign: TextAlign.center,
              S.of(context).notHaveAnyAdsText,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      );
}
