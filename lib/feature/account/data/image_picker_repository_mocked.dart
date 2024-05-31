import 'package:buy_and_dot/feature/account/repository/image_picker_repository.dart';
import 'package:image_picker/image_picker.dart';

class EditAccountImagePickerMockedReposiory implements EditAccountImagePickerRepository {
  final ImagePicker picker = ImagePicker();
  @override
  Future<XFile?> getPhoto() async {
    final XFile? image = await picker.pickImage(source: ImageSource.camera, );
    return image;

  }
}