import 'package:image_picker/image_picker.dart';

class MediaHelper {
  static handleImageFromGallery() async {
    return await ImagePicker.pickImage(source: ImageSource.gallery);
  }

  static handleImageFromCamera() async {
    return await ImagePicker.pickImage(source: ImageSource.camera);
  }
}