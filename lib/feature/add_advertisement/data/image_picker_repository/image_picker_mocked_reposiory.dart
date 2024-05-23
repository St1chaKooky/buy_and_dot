import 'package:buy_and_dot/feature/add_advertisement/domain/repository/image_picker_repository.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerMockedReposiory implements ImagePickerRepository {
  final ImagePicker picker = ImagePicker();
  @override
  Future<XFile?> getCamera() async {
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    return photo;
  }
  
  @override
  Future<XFile?> getPhoto() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    return image;
  }
}