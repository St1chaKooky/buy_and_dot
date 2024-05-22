import 'package:bloc/bloc.dart';
import 'package:buy_and_dot/feature/add_advertisement/domain/entity/city_entity.dart';
import 'package:meta/meta.dart';

part 'city_event.dart';
part 'city_state.dart';

class CityBloc extends Bloc<CityEvent, CityState> {
  CityBloc(super.initialState) {
    on<ChangeCityEvent>((event, emit) {
      emit(CityState(city: supportCityList.indexOf(event.newCityEntity)));
    });
  }
  CityEntity get currentCity => supportCityList[state.city];
  final List<CityEntity> supportCityList = const[
    CityEntity(name: 'Тирасполь'),
    CityEntity(name: 'Рыбница'),
    

  ];
}
