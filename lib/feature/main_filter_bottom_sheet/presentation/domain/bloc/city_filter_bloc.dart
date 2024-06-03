import 'package:bloc/bloc.dart';
import 'package:buy_and_dot/feature/main_filter_bottom_sheet/domain/entity/locality.dart';
import 'package:meta/meta.dart';

part 'city_filter_event.dart';
part 'city_filter_state.dart';

class CityFilterBloc extends Bloc<CityFilterEvent, CityFilterState> {
  CityFilterBloc()
      : super(CityFilterState(
            localityActivityMap: { for (var element in LocalityList.values) element : false })) {
    on<ChangeCityFilter>((event, emit) {
      emit(CityFilterState(
        localityActivityMap: event.localityActivityMap,
      ));
    });
  }

  List<Locality> get activeLocalityList => state.localityActivityMap.entries
      .where((entry) => entry.value)
      .map(
        (e) => e.key,
      )
      .toList();
  
}
