import 'package:buy_and_dot/feature/filter/domain/entity/locality.dart';

class AdvertisementListItem {
  final String id;
  final String title;
  final String description;
  final DateTime creationDate;
  final double cost;
  final Locality locality;
  final bool isFavorite;

  const AdvertisementListItem({
    required this.id,
    required this.title,
    required this.description,
    required this.creationDate,
    required this.cost,
    required this.locality,
    required this.isFavorite,
  });
}
