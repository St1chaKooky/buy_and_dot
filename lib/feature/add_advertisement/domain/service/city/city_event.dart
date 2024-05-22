part of 'city_bloc.dart';

@immutable
sealed class CityEvent {
  const CityEvent();
}
class ChangeCityEvent extends CityEvent{
  final CityEntity newCityEntity;
  const ChangeCityEvent(this.newCityEntity);
}
