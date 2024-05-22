import 'package:buy_and_dot/feature/add_advertisement/domain/entity/price_entity.dart';
import 'package:buy_and_dot/feature/add_advertisement/domain/service/currency/currency_bloc.dart';
import 'package:buy_and_dot/feature/add_advertisement/presentation/widget/app_bar.dart';
import 'package:buy_and_dot/feature/add_advertisement/presentation/widget/price_input.dart';

import 'package:buy_and_dot/theme/collections/color_collection.dart/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddAdvertisementScreen extends StatefulWidget {
  const AddAdvertisementScreen({super.key});

  @override
  State<AddAdvertisementScreen> createState() => _AddAdvertisementScreenState();
}

class _AddAdvertisementScreenState extends State<AddAdvertisementScreen> {
  TextEditingController textEditingController = TextEditingController();
   final CurrencyBloc _appSettingsBloc = CurrencyBloc(CurrencyState(currency: 0));
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
                // S.of(context).name,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: ColorCollection.onSurfaceVar),
                overflow: TextOverflow.fade,
              ),
              SizedBox(
                height: 12,
              ),
              Row(children: [
                Row(children: [
                Container(
                width: 100,
                child: PriceInput(
                  textEditingController: textEditingController,
                  labelText: '0',
                ),
              ),
              ],),

              ],)
              
              
            ],
          ),
        ));
  }

  
  
}
