import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:todo/pages/controller/task_controller.dart';
import 'package:todo/pages/models/task_models.dart';
import 'package:todo/pages/routes/app_routes.dart';
import 'package:todo/pages/task_edit_page.dart';

class TaskPage extends StatelessWidget {
  TaskPage({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController detailController = TextEditingController();

  final TaskController taskController = Get.find<TaskController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Task page',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: taskController.tasks.length,
          itemBuilder: (context, index) {
            final task = taskController.tasks[index];
            return Slidable(
              key: ValueKey(task.name),
              endActionPane: ActionPane(
                motion: const DrawerMotion(),
                children: [
                  SlidableAction(
                    onPressed: (context) {
                      taskController.removeTasks(index);
                    },
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    icon: Icons.delete,
                    label: 'delete',
                  ),
                  SlidableAction(
                    onPressed: (context) async {
                      //taskController.upDateTasks(String,);
                      // Get.to(()=>TaskEditPage(),arguments: task);
                      final updateTask = await Get.to(
                        () => TaskEditPage(),
                        arguments: task,
                      );
                      if (updateTask!.isNull && updateTask is Task) {}
                    },
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    icon: Icons.edit,
                    label: 'Edit',
                  ),
                ],
              ),
              child: Card(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: ListTile(
                  title: Text(task.name),
                  subtitle: Text(task.detail),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoutes.TASK_REGISTRATION);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
