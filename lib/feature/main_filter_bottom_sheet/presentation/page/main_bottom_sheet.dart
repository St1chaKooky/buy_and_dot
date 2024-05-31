import 'package:buy_and_dot/core/domain/intl/generated/l10n.dart';
import 'package:buy_and_dot/core/presentation/widget/button/bottomSheet_text_button.dart';
import 'package:buy_and_dot/feature/main_filter_bottom_sheet/presentation/page/filter_view_model.dart';
import 'package:buy_and_dot/feature/main_filter_bottom_sheet/presentation/page/list_city_bottom_sheet.dart';
import 'package:buy_and_dot/feature/main_filter_bottom_sheet/presentation/widget/bottom_sheet_text_field.dart';
import 'package:buy_and_dot/feature/main_filter_bottom_sheet/presentation/widget/input_chip.dart';

import 'package:buy_and_dot/theme/collections/color_collection.dart/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:view_model_divider/view_model.dart';

class MainBottomSheet extends BaseView<FilterViewModel> {
  // final FilterViewModel _viewModel;

   MainBottomSheet({super.key}): super(vmFactory: (context) => FilterViewModel(context),) ;

  final TextEditingController minPriceTextEditingController =
      TextEditingController();
  final TextEditingController maxPriceTextEditingController =
      TextEditingController();

  @override
  Widget build(FilterViewModel vm) {
    
  double  screenHeight = MediaQuery.of(vm.context).size.height;
  double  screenWidth = MediaQuery.of(vm.context).size.width;
    return Container(
        padding: const EdgeInsets.only(bottom: 16, right: 16, left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _headerBuilder(vm),
            const SizedBox(
              height: 14,
            ),
            _cityFilterBuilder(vm),
            const SizedBox(
              height: 24,
            ),
            _coutFilterBuilder(vm),
            SizedBox(height: MediaQuery.of(vm.context).padding.bottom),
          ],
        ));
  }

  Widget _headerBuilder(FilterViewModel vm) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            S.of(vm.context).filters,
            style: Theme.of(vm.context)
                .textTheme
                .titleLarge!
                .copyWith(color: ColorCollection.onSurfaceVar),
          ),
          BottomSheetTextButton(
            text: S.of(vm.context).apply,
            onTap: vm.context.pop,
          ),
        ],
      );
  Widget _cityFilterBuilder(FilterViewModel vm) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(vm.context).city,
            style: Theme.of(vm.context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            height: 32,
            child: ValueListenableBuilder(
                valueListenable: vm.isActiveCityList,
                builder: (context, value, child) => ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => InputChipWidget(
                           text: vm.isActiveCityList.value[index],
                        ),
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 12),
                    itemCount: vm.isActiveCityList.value.length)),
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
                context: vm.context,
                builder: (context) =>  ListCityBottomSheet()),
            text: S.of(vm.context).addCity,
          ),
        ],
      );
  Widget _coutFilterBuilder(FilterViewModel vm) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(S.of(vm.context).adPrice,
              style: Theme.of(vm.context).textTheme.titleMedium),
          const SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Expanded(
                child: BottomSheetTextField(
                  textEditingController: minPriceTextEditingController,
                  labelText: S.of(vm.context).from,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: BottomSheetTextField(
                  textEditingController: maxPriceTextEditingController,
                  labelText: S.of(vm.context).before,
                ),
              ),
            ],
          )
        ],
      );
}
