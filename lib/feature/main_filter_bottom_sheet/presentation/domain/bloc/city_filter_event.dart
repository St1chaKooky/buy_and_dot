part of 'city_filter_bloc.dart';

@immutable
sealed class CityFilterEvent {}

class ChangeCityFilter extends CityFilterEvent {

  final Map<Locality, bool> localityActivityMap;
  ChangeCityFilter(this.localityActivityMap);
}