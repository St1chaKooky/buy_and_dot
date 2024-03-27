import 'package:buy_and_dot/core/domain/use_case_result/use_case_result.dart';
import 'package:buy_and_dot/feature/advertisement/domain/entity/advertisement_creation_item.dart';
import 'package:buy_and_dot/feature/advertisement/domain/entity/advertisement_list_filter.dart';
import 'package:buy_and_dot/feature/advertisement/domain/entity/advertisement_list_item.dart';

abstract class AdvertisementRepository {
  Future<UseCaseResult<List<AdvertisementListItem>>> getList(
      AdvertisementListFilter filter);

  Future<UseCaseResult<AdvertisementListItem>> add(
      AdvertisementCreationEntity advCreationEntity);

  Future<UseCaseResult<void>> delete(final String id);
}
