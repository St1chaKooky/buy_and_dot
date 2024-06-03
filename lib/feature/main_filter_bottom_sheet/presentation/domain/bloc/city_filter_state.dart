part of 'city_filter_bloc.dart';

@immutable
class CityFilterState {

  final Map<Locality, bool> localityActivityMap;

  CityFilterState({
    required this.localityActivityMap,
  });
}
