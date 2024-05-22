
import 'package:buy_and_dot/feature/add_advertisement/domain/entity/city_entity.dart';
import 'package:buy_and_dot/feature/add_advertisement/domain/service/city/city_bloc.dart';
import 'package:buy_and_dot/theme/collections/color_collection.dart/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCityDropdownMenu extends StatefulWidget {
  final CityBloc cityBloc;
  const MyCityDropdownMenu({super.key, required this.cityBloc});

  @override
  State<MyCityDropdownMenu> createState() => My_CurrencyDropdownMenuState();
}

class My_CurrencyDropdownMenuState extends State<MyCityDropdownMenu> {
  CityBloc get _myBloc => widget.cityBloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CityBloc, CityState>(
    bloc: _myBloc,
        builder: (context, state) {
          return DropdownMenu<CityEntity>(
              width: 165,
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
                _myBloc.currentCity.name,
                
              textStyle: Theme.of(context).textTheme.labelLarge,
              onSelected: (value) {
                if (value != null) {
                  _myBloc.add(ChangeCityEvent(value));
                }
              },
              dropdownMenuEntries: _myBloc.supportCityList
                  .map((e) => DropdownMenuEntry<CityEntity>(
                        value: e,
                        label: e.name,
                      ))
                  .toList());
        },
      );
  }
}