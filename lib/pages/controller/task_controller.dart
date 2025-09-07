import 'package:get/get.dart';
import '../models/task_models.dart';

class TaskController extends GetxController {
  RxList<Task> tasks = <Task>[].obs;

  void addTask(String name, String detail,  imagePath) {
    tasks.add(Task(name: name, detail: detail, imagePath: imagePath));
  }

  void removeTask(int index) {
    tasks.removeAt(index);
  }

  void editTask(int index, String newName, String newDetail ) {
    tasks[index] = Task(
      name: newName,
      detail: newDetail,
      imagePath: tasks[index].imagePath,
    );
  }

  void clearAll() {
    tasks.clear();
  }
}
