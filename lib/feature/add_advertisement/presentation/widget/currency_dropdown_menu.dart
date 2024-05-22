import 'package:buy_and_dot/feature/add_advertisement/domain/entity/price_entity.dart';
import 'package:buy_and_dot/feature/add_advertisement/domain/service/currency/currency_bloc.dart';
import 'package:buy_and_dot/theme/collections/color_collection.dart/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCurrencyDropDownMenu extends StatefulWidget {
  final CurrencyBloc myBloc;
  const MyCurrencyDropDownMenu({super.key, required this.myBloc});

  @override
  State<MyCurrencyDropDownMenu> createState() => MyCurrencyDropDownMenuState();
}

class MyCurrencyDropDownMenuState extends State<MyCurrencyDropDownMenu> {
  CurrencyBloc get _myBloc => widget.myBloc;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrencyBloc, CurrencyState>(
    bloc: _myBloc,
        builder: (context, state) {
          return DropdownMenu<PriceEntity>(
              width: 100,
              inputDecorationTheme: InputDecorationTheme(
                floatingLabelStyle: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: ColorCollection.primary),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  borderSide: BorderSide(
                      color: ColorCollection.primary,
                      width: 3), // Убираем границу, оставляя только закругления
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1), // Убираем границу, оставляя только закругления
                ),
              ),
              hintText: 
                _myBloc.currentCurrency.name,
                
              textStyle: Theme.of(context).textTheme.labelLarge,
              onSelected: (value) {
                if (value != null) {
                  _myBloc.add(ChangeLocalEvent(value));
                }
              },
              dropdownMenuEntries: _myBloc.supportCurrencyList
                  .map((e) => DropdownMenuEntry<PriceEntity>(
                        value: e,
                        label: e.name,
                      ))
                  .toList());
        },
      );
  }
}