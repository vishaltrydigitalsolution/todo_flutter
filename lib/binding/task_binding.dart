import 'package:get/get.dart';
import 'package:todo/pages/controller/task_controller.dart';
import 'package:todo/pages/controller/task_register_controller.dart';
class TaskBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<TaskController>(() => TaskController());
    Get.lazyPut<TaskRegisterController>(() => TaskRegisterController());
  }

}