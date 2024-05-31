import 'package:buy_and_dot/core/domain/intl/generated/l10n.dart';
import 'package:buy_and_dot/core/presentation/widget/button/bottomSheet_text_button.dart';
import 'package:buy_and_dot/core/presentation/widget/checkbox/selected_checkbox.dart';
import 'package:buy_and_dot/feature/main_filter_bottom_sheet/domain/entity/locality.dart';
import 'package:buy_and_dot/feature/main_filter_bottom_sheet/presentation/page/filter_view_model.dart';
import 'package:buy_and_dot/theme/collections/color_collection.dart/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:view_model_divider/view_model.dart';

class ListCityBottomSheet extends BaseView<FilterViewModel> {

   ListCityBottomSheet({super.key}):super(vmFactory: (context) => FilterViewModel(context));

 

  @override
  Widget build(FilterViewModel vm) {
 
  double  screenHeight = MediaQuery.of(vm.context).size.height;
  double  screenWidth = MediaQuery.of(vm.context).size.width;


    return Container(
        padding: const EdgeInsets.only(bottom: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _headerBuilder(vm),
            const SizedBox(
              height: 14,
            ),
            SizedBox(
              height: 350,
              child: ValueListenableBuilder(
                  valueListenable: vm.isActiveCityList,
                  builder: (context, value, child) => ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) => Container(
                        
                        child: Row(
                          children: [
                            MySelectedCheckbox(value: true, onTap: (value ){
                                          vm.addCity(index);
                              }),
                            Text(vm.localityListStrings[index])
                          ],
                        ),
                      ),
                
                      itemCount: vm.localityListStrings.length)),
            ),
            SizedBox(height: MediaQuery.of(vm.context).padding.bottom),
          ],
        ));
  }

  Widget  _headerBuilder(FilterViewModel vm) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  icon: const Icon(
                    size: 18,
                    Icons.arrow_back_outlined,
                    color: ColorCollection.outline,
                  )),
              Text(
                S.of(vm.context).city,
                style: Theme.of(vm.context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: ColorCollection.onSurfaceVar),
              ),
            ],
          ),
          BottomSheetTextButton(
            text: S.of(vm.context).reset,
            onTap: () {},
          ),
        ],
      );
}

