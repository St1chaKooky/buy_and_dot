import 'package:buy_and_dot/core/domain/router/router.dart';
import 'package:buy_and_dot/feature/advertisement/domain/entity/advertisement_list_item.dart';
import 'package:buy_and_dot/theme/collections/color_collection.dart/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:like_button/like_button.dart';

class AdvertisementListItemWidget extends StatelessWidget {
  final AdvertisementListItem advertisementListItem;

  const AdvertisementListItemWidget({
    super.key,
    required this.advertisementListItem,
  });

  BoxDecoration _cardDecoration(BuildContext context) => BoxDecoration(
        color: ColorCollection.surface,
        border: Border.all(
          width: 1,
          color: ColorCollection.outlineVariant,
        ),
        borderRadius: BorderRadius.circular(12),
      );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      // () => context
      //     .go('${RouteList.advertisementDetails}/${advertisementListItem.id}'),
      child: Container(
        decoration: _cardDecoration(context),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _previewBuilder(),
            _bodyAdvertisementItemBuilder(context),
          ],
        ),
      ),
    );
  }

  Widget _titleBuilder(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            advertisementListItem.title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          LikeButton(
            isLiked: advertisementListItem.isFavorite,
            animationDuration: const Duration(milliseconds: 400),
            size: 24,
            likeBuilder: (isLiked) {
              return Icon(
                isLiked
                    ? Icons.favorite_outlined
                    : Icons.favorite_border_outlined,
                size: 24,
                color: isLiked
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.outline,
              );
            },
          ),
        ],
      );

  Widget _bodyAdvertisementItemBuilder(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ).copyWith(top: 8, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _titleBuilder(context),
            const SizedBox(height: 16),
            _contentBuilder(context),
          ],
        ),
      );

  Widget _previewBuilder() =>
      const Placeholder(fallbackWidth: 360.0, fallbackHeight: 176.0);

  Widget _contentBuilder(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            advertisementListItem.description,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: ColorCollection.onSurfaceVar),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            advertisementListItem.cost.toString(),
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            advertisementListItem.locality.name(context),
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: ColorCollection.outline),
          ),
          Text(
            //чуть позже напишу функцию для норм времени
            advertisementListItem.creationDate.toString(),
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: ColorCollection.outline),
          ),
        ],
      );
}
