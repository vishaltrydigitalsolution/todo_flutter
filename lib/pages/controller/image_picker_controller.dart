import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';

class ImagePickerController extends GetxController {
  final Rxn<File> pickedImageFile = Rxn<File>();
  final ImagePicker picker = ImagePicker();
  String?imagePath;


  Future<void> pickImage(ImageSource source) async {
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      pickedImageFile.value = File(pickedFile.path);
    }
  }

  void clearImage() {
    pickedImageFile.value = null;
  }
}
