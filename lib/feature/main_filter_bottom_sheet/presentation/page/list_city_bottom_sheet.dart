import 'package:buy_and_dot/core/domain/intl/generated/l10n.dart';
import 'package:buy_and_dot/core/presentation/widget/button/bottomSheet_text_button.dart';
import 'package:buy_and_dot/core/presentation/widget/checkbox/selected_checkbox.dart';
import 'package:buy_and_dot/feature/main_filter_bottom_sheet/domain/entity/locality.dart';
import 'package:buy_and_dot/feature/main_filter_bottom_sheet/presentation/domain/bloc/city_filter_bloc.dart';
import 'package:buy_and_dot/theme/collections/color_collection.dart/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ListCityBottomSheet extends StatefulWidget {
  final CityFilterBloc mainFilterBloc;
  const ListCityBottomSheet({super.key, required this.mainFilterBloc});

  @override
  State<ListCityBottomSheet> createState() => _ListCityBottomSheetState();
}

class _ListCityBottomSheetState extends State<ListCityBottomSheet> {
  CityFilterBloc get mainFilterBloc => widget.mainFilterBloc;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(bottom: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _headerBuilder(context),
            const SizedBox(
              height: 14,
            ),
            SizedBox(
              height: 350,
              child: BlocBuilder<CityFilterBloc, CityFilterState>(
                bloc: mainFilterBloc,
                builder: (context, state) {
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) => Container(
                      child: Row(
                        children: [
                          MySelectedCheckbox(
                              value: state.localityActivityMap[
                                  LocalityList.values[index]],
                              onTap: (value) {
                                
                                state.localityActivityMap[
                                    LocalityList.values[index]] = value!;
                                mainFilterBloc.add(ChangeCityFilter(
                                    state.localityActivityMap));
                              }),
                          Text(LocalityList.values[index].name(context))
                        ],
                      ),
                    ),
                    itemCount: LocalityList.values.length,
                  );
                },
              ),
            ),
            SizedBox(height: MediaQuery.of(context).padding.bottom),
          ],
        ));
  }
}

Widget _headerBuilder(BuildContext context) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
                padding: EdgeInsets.zero,
                onPressed: context.pop,
                icon: const Icon(
                  size: 18,
                  Icons.arrow_back_outlined,
                  color: ColorCollection.outline,
                )),
            Text(
              S.of(context).city,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
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
