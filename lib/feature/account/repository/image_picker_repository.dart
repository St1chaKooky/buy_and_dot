import 'package:image_picker/image_picker.dart';

abstract class EditAccountImagePickerRepository {
  Future<XFile?> getPhoto();
}