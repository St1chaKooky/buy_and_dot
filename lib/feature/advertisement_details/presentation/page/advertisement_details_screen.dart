import 'package:buy_and_dot/feature/advertisement/domain/entity/advertisement_list_item.dart';
import 'package:buy_and_dot/feature/advertisement_details/presentation/widget/app_bar.dart';
import 'package:flutter/material.dart';

class AdvertisementDetailsScreen extends StatefulWidget {
  final bool isMineAdvertisement;
  final AdvertisementListItem advertisementListItem;
  const AdvertisementDetailsScreen(
      {super.key,
      required this.advertisementListItem,
      required this.isMineAdvertisement});

  @override
  State<AdvertisementDetailsScreen> createState() =>
      _AdvertisementDetailsScreenState();
}

class _AdvertisementDetailsScreenState
    extends State<AdvertisementDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarAdvertisementDetails(
        context: context,
        isMineAdvertisement: widget.isMineAdvertisement,
      ),
    );
  }
}
