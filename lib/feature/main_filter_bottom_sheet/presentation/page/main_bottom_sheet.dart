import 'package:buy_and_dot/core/presentation/widget/button/bottomSheet_text_button.dart';
import 'package:buy_and_dot/core/domain/intl/generated/l10n.dart';
import 'package:buy_and_dot/feature/main_filter_bottom_sheet/presentation/page/list_city_bottom_sheet.dart';
import 'package:buy_and_dot/feature/main_filter_bottom_sheet/presentation/widget/bottom_sheet_text_field.dart';
import 'package:buy_and_dot/feature/main_filter_bottom_sheet/presentation/widget/input_chip.dart';

import 'package:buy_and_dot/theme/collections/color_collection.dart/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class MainBottomSheet extends StatefulWidget {
  const MainBottomSheet({super.key});

  @override
  State<MainBottomSheet> createState() => _MainBottomSheetState();
}

class _MainBottomSheetState extends State<MainBottomSheet> {
  double get screenHeight => MediaQuery.of(context).size.height;
  double get screenWidth => MediaQuery.of(context).size.width;
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
            _headerBuilder,
            const SizedBox(
              height: 14,
            ),
            _cityFilterBuilder,
            const SizedBox(
              height: 24,
            ),
            _coutFilterBuilder,
            SizedBox(height: MediaQuery.of(context).padding.bottom),
          ],
        ));
  }

  Widget get _headerBuilder => Row(
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
  Widget get _cityFilterBuilder => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).city,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            height: 32,
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                width: 8,
              ),
              scrollDirection: Axis.horizontal,
              itemCount: 20,
              itemBuilder: (context, index) => InputChipWidget(
                text: 'Тирасполь',
              ),
            ),
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
                builder: (context) => const ListCityBottomSheet()),
            text: S.of(context).addCity,
          ),
        ],
      );
  Widget get _coutFilterBuilder => Column(
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
