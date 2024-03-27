import 'package:buy_and_dot/core/domain/app_error/app_error.dart';
import 'package:buy_and_dot/core/domain/use_case_result/use_case_result.dart';
import 'package:buy_and_dot/feature/advertisement/domain/entity/advertisement_creation_item.dart';
import 'package:buy_and_dot/feature/advertisement/domain/entity/advertisement_list_filter.dart';
import 'package:buy_and_dot/feature/advertisement/domain/entity/advertisement_list_item.dart';
import 'package:buy_and_dot/feature/advertisement/domain/repository/advertisement_repository.dart';
import 'package:buy_and_dot/feature/locality/domain/entity/locality.dart';

class AdvertisementMockedRepository implements AdvertisementRepository {
  final _mockedAdvList = List<AdvertisementListItem>.generate(
    30,
    (index) {
      final localityCount = LocalityList.values.length;
      final locality = LocalityList.values[index % localityCount];

      return AdvertisementListItem(
        id: '$index',
        title: 'title $index',
        description: 'description $index',
        creationDate: DateTime(2024, 1, index + 1),
        cost: index * 123,
        locality: locality,
        isFavorite: index.isEven,
      );
    },
  );

  @override
  Future<UseCaseResult<List<AdvertisementListItem>>> getList(
      AdvertisementListFilter filter) async {
    await Future.delayed(const Duration(seconds: 2));
    try {
      return UseCaseResult.good(_mockedAdvList
          .where((element) {
            if (filter.availableLocalityList.isNotEmpty) {
              final localityResult =
                  filter.availableLocalityList.contains(element.locality);
              if (!localityResult) return false;
            }
            return true;
          })
          .skip(filter.page * filter.limit)
          .take(filter.limit)
          .toList());
    } catch (e) {
      return UseCaseResult.bad([SpecificError('getList error')]);
    }
  }

  @override
  Future<UseCaseResult<AdvertisementListItem>> add(
      AdvertisementCreationEntity advCreationEntity) {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  Future<UseCaseResult<void>> delete(String id) {
    // TODO: implement delete
    throw UnimplementedError();
  }
}
