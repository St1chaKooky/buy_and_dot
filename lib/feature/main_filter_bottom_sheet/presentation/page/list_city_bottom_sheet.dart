import 'package:buy_and_dot/core/domain/intl/generated/l10n.dart';
import 'package:buy_and_dot/core/presentation/widget/button/bottomSheet_text_button.dart';
import 'package:buy_and_dot/theme/collections/color_collection.dart/color_manager.dart';
import 'package:flutter/material.dart';

class ListCityBottomSheet extends StatefulWidget {
  const ListCityBottomSheet({super.key});

  @override
  State<ListCityBottomSheet> createState() => _ListCityBottomSheetState();
}

class _ListCityBottomSheetState extends State<ListCityBottomSheet> {
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
            _cityListBuilder,
            SizedBox(height: MediaQuery.of(context).padding.bottom),
          ],
        ));
  }

  Widget get _headerBuilder => Row(
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
                S.of(context).city,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: ColorCollection.onSurfaceVar),
              ),
            ],
          ),
          BottomSheetTextButton(
            text: S.of(context).reset,
            onTap: () {},
          ),
        ],
      );
  Widget get _cityListBuilder => ListView.builder(
        itemCount: 8,
        itemBuilder: (context, index) {
          return CheckboxListTile(
            title: const Text('Тирасполь'),
            value: true,
            onChanged: (bool? value) {},
          );
        },
      );
}
