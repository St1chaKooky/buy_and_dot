import 'package:buy_and_dot/core/domain/intl/generated/l10n.dart';
import 'package:buy_and_dot/core/domain/router/router.dart';
import 'package:buy_and_dot/core/presentation/widget/app_bar/main_app_bar.dart';
import 'package:buy_and_dot/feature/advertisement/presentation/page/all_advertisement/advertisement_list_page.dart';
import 'package:buy_and_dot/feature/favorites/presentation/favorite_view_model.dart';
import 'package:buy_and_dot/theme/collections/svg_collection/svg_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class FavoritesScreen extends StatefulWidget {
  final FavoriteListViewModel _viewModel;
  const FavoritesScreen({super.key, required FavoriteListViewModel viewModel})
      : _viewModel = viewModel;

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  TextEditingController textFieldEditingController = TextEditingController();
  FavoriteListViewModel get _viewModel => widget._viewModel;

  @override
  Widget build(BuildContext context) {
    return _viewModel.advertisementList.value.isNotEmpty
        ? _isNotEmptyPostsBuilder
        : _emptyPostsBuilder;
  }

  Widget get _emptyPostsBuilder => Scaffold(
        appBar: AppBar(
          title: Text(
            S.of(context).favorite,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        floatingActionButton: FloatingActionButton.small(
          child: const Icon(Icons.add),
          onPressed: () => context.go(RouteList.addAdvertisement),
          //  () => context.go(RouteList.addAdvertisement),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                  width: 120,
                  height: 120,
                  SvgCollection.bigLike,
                  fit: BoxFit.scaleDown),
              const SizedBox(height: 16),
              Text(
                textAlign: TextAlign.center,
                S.of(context).addAdsToFav,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              Text(
                S.of(context).YouCanComeBack,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      );
  Widget get _isNotEmptyPostsBuilder => Scaffold(
        floatingActionButton: FloatingActionButton.small(
          child: const Icon(Icons.add),
          onPressed: () => context.go(RouteList.addAdvertisement),
        ),
        appBar: MainAppBar(
          isMainScreen: false,
          textEditingController: textFieldEditingController,
          context: context,
        ),
        body: AdvertisementListPage(
          viewModel: _viewModel,
        ),
      );
}
