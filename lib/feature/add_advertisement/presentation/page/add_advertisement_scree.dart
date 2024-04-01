import 'package:buy_and_dot/feature/add_advertisement/presentation/widget/app_bar.dart';
import 'package:flutter/material.dart';

class AddAdvertisementScreen extends StatelessWidget {
  const AddAdvertisementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AddAdvertisementAppBar(
        context: context,
      ),
    );
  }
}
