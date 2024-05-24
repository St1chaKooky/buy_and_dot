import 'package:buy_and_dot/feature/advertisement_details/presentation/widget/app_bar.dart';
import 'package:buy_and_dot/feature/advertisement_details/presentation/widget/slider_widget.dart';
import 'package:flutter/material.dart';

class AdvertisementDetailsScreen extends StatefulWidget {
  final String id;
  const AdvertisementDetailsScreen({
    super.key,
    required this.id,
  });

  @override
  State<AdvertisementDetailsScreen> createState() =>
      _AdvertisementDetailsScreenState();
}

class _AdvertisementDetailsScreenState
    extends State<AdvertisementDetailsScreen> {
  //пусть пока так
  final int myId = 123;
  final int unknownId = 123;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarAdvertisementDetails(
        context: context,
        isMineAdvertisement: unknownId == myId,
      ),
      body: SliderWidget(),
    );
  }
}
