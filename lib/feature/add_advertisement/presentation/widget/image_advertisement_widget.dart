import 'dart:io';

import 'package:buy_and_dot/core/presentation/widget/icon/svg_custom_icon.dart';
import 'package:buy_and_dot/feature/add_advertisement/presentation/page/view_model_add_advertisement.dart';
import 'package:buy_and_dot/theme/collections/color_collection.dart/color_manager.dart';
import 'package:buy_and_dot/theme/collections/svg_collection/svg_collection.dart';
import 'package:flutter/material.dart';

class ImageAdvertisementWidget extends StatelessWidget {
  final int indexImage;
  final ViewModelAddAdvertisement viewModel;
  const ImageAdvertisementWidget(
      {super.key, required this.viewModel, required this.indexImage});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(5),
          ),
          width: 165,
          height: 125,
          // ignore: unnecessary_null_comparison
          child: viewModel.isActiveImageList.value[indexImage]!.path != null
              ? Image.file(
                  File(viewModel.isActiveImageList.value[indexImage]!.path))
              : null,
        ),
        Positioned(
          top: 0, // Position at the top
          right: 0, // Extend 10 pixels beyond the right edge
          width: 24,
          height: 24,
          child: InkWell(
            onTap: () => viewModel.deletedPhot(indexImage),
            child: Container(
              decoration: BoxDecoration(
                  color: ColorCollection.lightOutline,
                  borderRadius: BorderRadius.circular(20)),
              child: const CustomIconSvg(assetName: SvgCollection.crest),
            ),
          ),
        ),
      ],
    );
  }
}
