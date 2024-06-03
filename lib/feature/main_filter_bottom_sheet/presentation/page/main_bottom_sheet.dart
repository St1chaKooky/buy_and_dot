import 'package:buy_and_dot/core/domain/intl/generated/l10n.dart';
import 'package:buy_and_dot/core/presentation/widget/button/bottomSheet_text_button.dart';
import 'package:buy_and_dot/feature/main_filter_bottom_sheet/domain/entity/locality.dart';
import 'package:buy_and_dot/feature/main_filter_bottom_sheet/presentation/domain/bloc/city_filter_bloc.dart';
import 'package:buy_and_dot/feature/main_filter_bottom_sheet/presentation/page/list_city_bottom_sheet.dart';
import 'package:buy_and_dot/feature/main_filter_bottom_sheet/presentation/widget/bottom_sheet_text_field.dart';
import 'package:buy_and_dot/feature/main_filter_bottom_sheet/presentation/widget/input_chip.dart';

import 'package:buy_and_dot/theme/collections/color_collection.dart/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MainBottomSheet extends StatefulWidget {
  final CityFilterBloc mainFilterBloc;

  const MainBottomSheet({super.key, required this.mainFilterBloc});
  @override
  State<MainBottomSheet> createState() => _MainBottomSheetState();
}

class _MainBottomSheetState extends State<MainBottomSheet> {
  CityFilterBloc get mainFilterBloc => widget.mainFilterBloc;

  final TextEditingController minPriceTextEditingController =
      TextEditingController();
  final TextEditingController maxPriceTextEditingController =
      TextEditingController();


  
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(bottom: 16, right: 16, left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _headerBuilder(context),
            const SizedBox(
              height: 14,
            ),
            _cityFilterBuilder(context),
            const SizedBox(
              height: 24,
            ),
            _coutFilterBuilder(context),
            SizedBox(height: MediaQuery.of(context).padding.bottom),
          ],
        ));
  }

  Widget _headerBuilder(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            S.of(context).filters,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: ColorCollection.onSurfaceVar),
          ),
          BottomSheetTextButton(
            text: S.of(context).apply,
            onTap: context.pop,
          ),
        ],
      );
  Widget _cityFilterBuilder(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).city,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 12,
          ),
          Column(
            children: [
              SizedBox(
                height: 35,
                child: BlocBuilder<CityFilterBloc, CityFilterState>(
                  bloc: mainFilterBloc,
                  builder: (context, state) {
                    return ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => state.localityActivityMap[
                                    LocalityList.values[index]]! ? InputChipWidget(
                        onTap: () {
                          
                            
                                 state.localityActivityMap[
                                    LocalityList.values[index]] = false;
                          mainFilterBloc.add(ChangeCityFilter(
                                    state.localityActivityMap));
                         
                        },
                        text: LocalityList.values[index].name(context), 
                      ): SizedBox(),
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 12),
                      itemCount: LocalityList.values.length,
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          BottomSheetTextButton(
            onTap: () => showModalBottomSheet(
                useRootNavigator: true,
                backgroundColor: ColorCollection.surfaceContainerLow,
                showDragHandle: true,
                enableDrag: false,
                context: context,
                builder: (context) => ListCityBottomSheet(
                      mainFilterBloc: mainFilterBloc,
                    )),
            text: S.of(context).addCity,
          ),
        ],
      );
  Widget _coutFilterBuilder(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(S.of(context).adPrice,
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Expanded(
                child: BottomSheetTextField(
                  textEditingController: minPriceTextEditingController,
                  labelText: S.of(context).from,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: BottomSheetTextField(
                  textEditingController: maxPriceTextEditingController,
                  labelText: S.of(context).before,
                ),
              ),
            ],
          )
        ],
      );
}
