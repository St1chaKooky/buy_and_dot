import 'package:buy_and_dot/feature/main_filter_bottom_sheet/domain/entity/locality.dart';

class AdvertisementCreationEntity {
  final String title;
  final String description;
  final double cost;
  final Locality locality;
  AdvertisementCreationEntity({
    required this.title,
    required this.description,
    required this.cost,
    required this.locality,
  });
}
