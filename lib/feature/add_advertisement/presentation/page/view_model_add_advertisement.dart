import 'package:buy_and_dot/feature/add_advertisement/domain/repository/image_picker_repository.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ViewModelAddAdvertisement {
  final ImagePickerRepository _imagePickerRepository;
  final isActiveImageList = ValueNotifier(<XFile?>[]);
  ViewModelAddAdvertisement(
      {required ImagePickerRepository imagePickerRepository})
      : _imagePickerRepository = imagePickerRepository;
  Future<void> getPhoto() async {
    final result = await _imagePickerRepository.getPhoto();
    if (result != null) {
    isActiveImageList.value = [...isActiveImageList.value, if (result != null) result];
  }
  }
  Future<void> getCamera() async {
    final result = await _imagePickerRepository.getCamera();
    if (result != null) {
    isActiveImageList.value = [...isActiveImageList.value, if (result != null) result];
  }
  }
}
