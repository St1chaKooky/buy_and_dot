import 'package:buy_and_dot/core/domain/router/router.dart';
import 'package:buy_and_dot/feature/advertisement_details/presentation/widget/app_bar.dart';
import 'package:buy_and_dot/theme/collections/color_collection.dart/color_manager.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
  final urlImages = [
    'https://life-trip.ru/wp-content/uploads/2018/06/lanta-klong-nin.jpg',
    'https://life-trip.ru/wp-content/uploads/2018/06/lanta-klong-nin.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarAdvertisementDetails(
        context: context,
        isMineAdvertisement: unknownId != myId,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          caruselBuilder,
          const SizedBox(
            height: 24,
          ),
          bodyBuilder,
          const SizedBox(
            height: 17,
          ),
          const Divider (
                height: 1,
                color:ColorCollection.outlineVariant,
              ),
          const SizedBox(
            height: 16,
          ),
          bottomBuilder,
        ],
      ),
    );
  }

  Widget get caruselBuilder => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 8),
      child: CarouselSlider.builder(
        options: CarouselOptions(
        height: 205.0,
        padEnds: false,
        viewportFraction: 0.8,
        enlargeCenterPage: false,
        ),
        itemCount: urlImages.length,
        itemBuilder: (context, index, realindex) {
          final urlImage = urlImages[index];
          return Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(28),
  ),
  margin: const EdgeInsets.symmetric(horizontal: 5),
  child: ClipRRect(
    borderRadius: BorderRadius.circular(28), // Same radius as container
    child: Image.network(
      urlImage,
      fit: BoxFit.cover,
    ),
  ),
);
        },
      ));
  Widget get bodyBuilder => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Сегодня' + ' 13:04',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: ColorCollection.outline),
                ),
                Text(
                  'Тирасполь',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: ColorCollection.outline),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text('Продажа велосипеда',
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(
              height: 8,
            ),
            Text('1200 руб.', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(
              height: 8,
            ),
            Text('Описание',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: ColorCollection.outline)),
            const SizedBox(
              height: 4,
            ),
            Text(
                softWrap: true,
                'Почти новый горный велосипед, бренд XYZ, 2023 года выпуска. Использовался всего несколько раз. Отличное состояние, все компоненты работают идеально. Продается в связи с переездом в другой город.',
                style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      );
  Widget get bottomBuilder => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            _accountDataBuilder,
            const SizedBox(
              height: 12,
            ),
            _contactDataBuilder,
          ],
        ),
      );
  Widget get _accountDataBuilder => Row(
        children: [
          GestureDetector(
            onTap: () => context.push(RouteList.accountAdvertisementDetails()),
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(
                        'https://static.dw.com/image/64742971_804.jpg',
                      ),
                      fit: BoxFit.cover)),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Евлампия Романова',
                  style: Theme.of(context).textTheme.bodyLarge),
              Text('на купи - и точка с декабря 2024',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: ColorCollection.onSurfaceVar))
            ],
          )
        ],
      );
  Widget get _contactDataBuilder => Column(
        children: [
          Row(
            children: [
              SizedBox(
                  child: SizedBox(
                height: 24.0,
                width: 24.0,
                child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: const Icon(size: 24, Icons.email_outlined)),
              )),
              const SizedBox(
                width: 16,
              ),
              Text('e.romanova@mail.ru',
                  style: Theme.of(context).textTheme.bodyLarge),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              SizedBox(
                  child: SizedBox(
                height: 24.0,
                width: 24.0,
                child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: const Icon(size: 24, Icons.phone_outlined)),
              )),
              const SizedBox(
                width: 16,
              ),
              Text('+ 373 779 3 12 03',
                  style: Theme.of(context).textTheme.bodyLarge),
            ],
          ),
        ],
      );
}
