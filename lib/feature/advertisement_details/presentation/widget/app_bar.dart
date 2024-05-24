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
                  ? LikeButton(
            isLiked: false,
            animationDuration: const Duration(milliseconds: 400),
            size: 48,
            likeBuilder: (isLiked) {
              return Icon(
                
                isLiked
                    ? Icons.favorite_outlined
                    : Icons.favorite_border_outlined,
                size: 26,
                color: isLiked
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.outline,
              );
            },
          )
                  : MyStandardIconButton(
                      iconFromCollection: SvgCollection.edit,
                      onTap: () {},
                      isSvgIcon: true,
                    )
            ]);
}
