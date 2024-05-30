import 'package:buy_and_dot/core/domain/intl/generated/l10n.dart';
import 'package:buy_and_dot/feature/add_advertisement/domain/service/city/city_bloc.dart';
import 'package:buy_and_dot/feature/add_advertisement/domain/service/currency/currency_bloc.dart';
import 'package:buy_and_dot/feature/add_advertisement/presentation/page/view_model_add_advertisement.dart';
import 'package:buy_and_dot/feature/add_advertisement/presentation/widget/app_bar.dart';
import 'package:buy_and_dot/feature/add_advertisement/presentation/widget/ccity_dropdown_menu.dart';
import 'package:buy_and_dot/feature/add_advertisement/presentation/widget/currency_dropdown_menu.dart';
import 'package:buy_and_dot/feature/add_advertisement/presentation/widget/custom_icon.dart';
import 'package:buy_and_dot/feature/add_advertisement/presentation/widget/image_advertisement_widget.dart';
import 'package:buy_and_dot/feature/add_advertisement/presentation/widget/price_input.dart';
import 'package:buy_and_dot/feature/add_advertisement/presentation/widget/title_advertisement_input.dart';
import 'package:buy_and_dot/theme/collections/svg_collection/svg_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class AddAdvertisementScreen extends StatefulWidget {
  final ViewModelAddAdvertisement _viewModel;
  const AddAdvertisementScreen(
      {super.key, required ViewModelAddAdvertisement viewModel})
      : _viewModel = viewModel;

  @override
  State<AddAdvertisementScreen> createState() => _AddAdvertisementScreenState();
}

class _AddAdvertisementScreenState extends State<AddAdvertisementScreen> {
  TextEditingController priceTextEditingController = TextEditingController();
  final CurrencyBloc _currencyBloc = CurrencyBloc(CurrencyState(currency: 0));
  final CityBloc _cityBloc = CityBloc(CityState(city: 0));
  TextEditingController titleTextEditingController = TextEditingController();
  TextEditingController descriptionTextEditingController = TextEditingController();
  ViewModelAddAdvertisement get _viewModel => widget._viewModel;
  List<Widget> myImageList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AddAdvertisementAppBar(
          context: context,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [_contentPageBuilder, _bottomEditBuilder],
        ));
  }

  Widget get _contentPageBuilder => Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16)
            .copyWith(bottom: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleAdvertisementInput(
              textEditingController: titleTextEditingController,
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 60,
                      child: PriceInput(
                        textEditingController: priceTextEditingController,
                        labelText: '0',
                      ),
                    ),
                    MyCurrencyDropDownMenu(
                      myBloc: _currencyBloc,
                    ),
                  ],
                ),
                MyCityDropdownMenu(
                  cityBloc: _cityBloc,
                ),
              ],
            ),
            TextField(
              decoration: InputDecoration(
                hintText: S.of(context).description,
                hintStyle: Theme.of(context).textTheme.bodyLarge,
                border: InputBorder.none,
              ),
              controller: descriptionTextEditingController,
              keyboardType: TextInputType.name,
              maxLines: null,
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              height: 125,
              child: ValueListenableBuilder(
                  valueListenable: _viewModel.isActiveImageList,
                  builder: (context, value, child) => ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => ImageAdvertisementWidget(viewModel: _viewModel, indexImage: index,),
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 12),
                      itemCount: _viewModel.isActiveImageList.value.length)),
            ),
            
          ],
        ),
      );
  Widget get _bottomEditBuilder => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ValueListenableBuilder(
                    valueListenable: _viewModel.isActiveImageList,
                    builder: (context, value, child) => InkWell(
                        onTap: _viewModel.getCamera,
                        child: const CustomIcon(
                          name: SvgCollection.camera,
                        )),
                  ),
                  ValueListenableBuilder(
                    valueListenable: _viewModel.isActiveImageList,
                    builder: (context, value, child) => InkWell(
                        onTap: _viewModel.getPhoto,
                        child: const CustomIcon(
                          name: SvgCollection.picture,
                        )),
                  ),
                ],
              ),
              ValueListenableBuilder(
                valueListenable: _viewModel.isActiveImageList,
                builder: (context, value, child) => InkWell(
                    onTap: () => _viewModel.getCamera,
                    child: CustomIcon(
                      name: SvgCollection.ellipsis,
                    )),
              ),
            ],
          ),
        ),
      );
}
