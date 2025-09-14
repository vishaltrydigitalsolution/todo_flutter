import 'package:get/get.dart';
import '../models/task_models.dart';
class TaskController extends GetxController {
  RxList<Task> tasks = <Task>[].obs;
  RxBool isMultiSelectionMode =false.obs;
  var isChecked =false.obs;
  void addTask(String name, String detail,   imagePath) {
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
    tasks.refresh();
  }
  void taskSelect(Task task){
    task.isSelected.toggle();
       tasks.refresh();

  }
  void clearSelection() {
    for (var task in tasks) {
      task.isSelected.value = false;
    }
    isMultiSelectionMode.value =false;
    tasks.refresh();
  }
  void toggleMultiSelectionMode(){
    isMultiSelectionMode.value =!isMultiSelectionMode.value;
    if(!isMultiSelectionMode.value){
      //clearSelection();
      tasks.refresh();
      }
    }
    void deleteSelectedTasks(){
    tasks.removeWhere((task)=>task.isSelected.value);
    clearSelection();
    tasks.refresh();
    }
    bool get hasSelectedTasks =>tasks.any((task)=>task.isSelected.value);
  tasksRefresh(){
    tasks.refresh();
  }
  void toggleCheckbox(){
    isChecked.value =!isChecked.value;
    tasks.refresh();
  }
  void toggleSelectAll(){
    final allSelected = tasks.every((task)=>task.isSelected.value);
    for(var task in tasks){
      task.isSelected.value =!allSelected;
    }
    tasks.refresh();
  }
  }




