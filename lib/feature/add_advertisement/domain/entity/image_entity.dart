import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageEntity{
  final Widget myWidget;
  final XFile fileImage;

  ImageEntity({required this.myWidget, required this.fileImage});
}