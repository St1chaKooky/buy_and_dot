import 'package:buy_and_dot/core/presentation/widget/icon_button/standard_icon_button.dart';
import 'package:buy_and_dot/theme/collections/svg_collection/svg_collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:like_button/like_button.dart';

class AppBarAdvertisementDetails extends AppBar {
  final bool isMineAdvertisement;

  AppBarAdvertisementDetails({
    super.key,
    required this.isMineAdvertisement,
    required BuildContext context,
  }) : super(
            title: null,
            leading: IconButton(
                onPressed: context.pop,
                icon: const Icon(Icons.arrow_back_outlined)),
            automaticallyImplyLeading: true,
            actions: [
              isMineAdvertisement
                  ? const LikeButton()
                  : MyStandardIconButton(
                      iconFromCollection: SvgCollection.edit,
                      onTap: () {},
                      isSvgIcon: true,
                    )
            ]);
}
