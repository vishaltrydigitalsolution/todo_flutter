import 'package:get/get.dart';

class Task {
  String name;
  String detail;
 String?imagePath;
  RxBool isSelected;
  Task({
      required this.name,
    required this.detail,
    this.imagePath,
    bool isSelected =false,
  })
  :isSelected =isSelected.obs;

}
