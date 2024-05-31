import 'package:buy_and_dot/feature/account/repository/image_picker_repository.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ViewModelEditAccount {
  final  EditAccountImagePickerRepository _imagePickerRepository;
  final isActiveImage = ValueNotifier<XFile?>(null);
  ViewModelEditAccount(
      {
        required EditAccountImagePickerRepository imagePickerRepository})
      : _imagePickerRepository = imagePickerRepository;
  Future<void> addNewPhoto() async {
    final result = await _imagePickerRepository.getPhoto();
    if (result != null) {
    isActiveImage.value = result;
  }
  }
  Future<void> submitChanges(int id) async {
    //без бека и моделек пока такб т.к. ток верстка

    
  }

}