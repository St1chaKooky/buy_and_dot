 import 'package:bloc/bloc.dart';
import 'package:buy_and_dot/feature/add_advertisement/domain/entity/price_entity.dart';
import 'package:meta/meta.dart';

part 'currency_event.dart';
part 'currency_state.dart';

class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  CurrencyBloc(super.initialState){
    on<ChangeLocalEvent>((event, emit) {
      emit(CurrencyState(currency: supportCurrencyList.indexOf(event.newCurrency)));
    });
  }
  PriceEntity get currentCurrency => supportCurrencyList[state.currency];
  final List<PriceEntity> supportCurrencyList = const[
    PriceEntity(name: 'руб.'),
    PriceEntity(name: 'руб./час.'),
    PriceEntity(name: 'руб./месяц.'),
    PriceEntity(name: 'руб./год'),
    PriceEntity(name: 'руб./разово'),

  ];
}