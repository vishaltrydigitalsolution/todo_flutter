import 'package:get/get.dart';
import '../models/task_models.dart';
class TaskController extends GetxController {
  var tasks = <Task>[].obs;
  void addTask(String name,String detail) {
    tasks.add(Task( name: name, detail: detail));
    tasks.refresh();
  }
void removeTasks(int index){
    tasks.removeAt(index);
    tasks.refresh();
}
void upDateTasks( index,String newName){
    tasks[index].name=newName;
    tasks.refresh();
}
}
