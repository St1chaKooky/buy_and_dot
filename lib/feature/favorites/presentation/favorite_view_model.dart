import 'package:buy_and_dot/core/domain/use_case_result/use_case_result.dart';
import 'package:buy_and_dot/feature/advertisement/domain/entity/advertisement_list_filter.dart';
import 'package:buy_and_dot/feature/advertisement/domain/entity/advertisement_list_item.dart';
import 'package:buy_and_dot/feature/advertisement/domain/repository/advertisement_repository.dart';
import 'package:buy_and_dot/feature/advertisement/presentation/page/all_advertisement/advertisement_list_view_model.dart';
import 'package:flutter/material.dart';

class FavoriteListViewModel implements AdvertisementListViewModel {
  // так как задание была только верстка, потом создадим уже репу
  //просто показал что должен прийти другой список
  final AdvertisementRepository _advertisementRepository;

  final advertisementList = ValueNotifier(<AdvertisementListItem>[]);

  FavoriteListViewModel({
    required AdvertisementRepository advertisementRepository,
  }) : _advertisementRepository = advertisementRepository;

  @override
  Future<void> getAdvPage(final int page) async {
    final result = await _advertisementRepository.getList(
      AdvertisementListFilter(
        availableLocalityList: [],
        page: page,
        limit: 10,
      ),
    );

    switch (result) {
      case GoodUseCaseResult<List<AdvertisementListItem>>(:final data):
        advertisementList.value = [...advertisementList.value, ...data];
        //  advertisementList.value.addAll(data);
        break;
      case BadUseCaseResult<List<AdvertisementListItem>>():
        advertisementList.value.clear();
        break;
    }
  }
}
