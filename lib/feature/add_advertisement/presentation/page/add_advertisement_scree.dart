
import 'package:buy_and_dot/feature/add_advertisement/domain/service/city/city_bloc.dart';
import 'package:buy_and_dot/feature/add_advertisement/domain/service/currency/currency_bloc.dart';
import 'package:buy_and_dot/feature/add_advertisement/presentation/widget/app_bar.dart';
import 'package:buy_and_dot/feature/add_advertisement/presentation/widget/ccity_dropdown_menu.dart';
import 'package:buy_and_dot/feature/add_advertisement/presentation/widget/currency_dropdown_menu.dart';
import 'package:buy_and_dot/feature/add_advertisement/presentation/widget/price_input.dart';

import 'package:buy_and_dot/theme/collections/color_collection.dart/color_manager.dart';
import 'package:flutter/material.dart';


class AddAdvertisementScreen extends StatefulWidget {
  const AddAdvertisementScreen({super.key});

  @override
  State<AddAdvertisementScreen> createState() => _AddAdvertisementScreenState();
}

class _AddAdvertisementScreenState extends State<AddAdvertisementScreen> {
  TextEditingController textEditingController = TextEditingController();
   final CurrencyBloc _currencyBloc = CurrencyBloc(CurrencyState(currency: 0));
   final CityBloc _cityBloc = CityBloc(CityState(city: 0));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AddAdvertisementAppBar(
          context: context,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Название',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: ColorCollection.onSurfaceVar),
                overflow: TextOverflow.fade,
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Row(children: [
                Container(
                width: 60,
                child: PriceInput(
                  textEditingController: textEditingController,
                  labelText: '0',
                ),
              ),
              MyCurrencyDropDownMenu(myBloc: _currencyBloc,),

              ],),
              MyCityDropdownMenu(cityBloc: _cityBloc,),
              ],)
              
              
            ],
          ),
        ));
  }

  
  
}
