import 'package:buy_and_dot/core/domain/use_case_result/use_case_result.dart';
import 'package:buy_and_dot/feature/advertisement/domain/entity/advertisement_list_filter.dart';
import 'package:buy_and_dot/feature/advertisement/domain/entity/advertisement_list_item.dart';
import 'package:buy_and_dot/feature/advertisement/domain/repository/advertisement_repository.dart';
import 'package:flutter/material.dart';

class AdvertisementListViewModel {
  final AdvertisementRepository _advertisementRepository;

  final advertisementList = ValueNotifier(<AdvertisementListItem>[]);

  AdvertisementListViewModel({
    required AdvertisementRepository advertisementRepository,
  }) : _advertisementRepository = advertisementRepository;

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
