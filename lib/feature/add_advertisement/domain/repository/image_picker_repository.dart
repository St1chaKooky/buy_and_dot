
import 'package:image_picker/image_picker.dart';

abstract class ImagePickerRepository {
  Future<XFile?> getPhoto();
  Future<XFile?> getCamera();
}