import 'package:get/get.dart';
import '../models/task_models.dart';
class TaskController extends GetxController {
  RxList tasks = <Task>[].obs;
  void addTask(  String name,String detail) {
    tasks.add(Task(  name:name ,detail:detail));
    tasks.refresh();
  }
void removeTasks( int index){
    tasks.removeAt(index);
    tasks.refresh();
}
 editTasks( int index,String newName,String newDetail){

      tasks[index].name = newName;
      tasks[index].detail=newDetail;
      tasks.refresh();

}
void clearAll(){
    tasks.clear();
    tasks.refresh();
}


}

