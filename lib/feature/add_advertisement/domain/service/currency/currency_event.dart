part of 'currency_bloc.dart';

@immutable
sealed class CurrencyEvent {
  const CurrencyEvent();
}
class ChangeLocalEvent extends CurrencyEvent{
  final PriceEntity newCurrency;
  const ChangeLocalEvent(this.newCurrency);
}
