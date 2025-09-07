import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:todo/pages/controller/task_controller.dart';
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
        leading: IconButton(
          onPressed: () {
            taskController.clearAll();
          },
          icon: Icon(Icons.clear_all,color: Colors.black,size: 30,),
        ),

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
                      taskController.removeTask(index);
                    },
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    icon: Icons.delete,
                    label: 'delete',
                  ),
                  SlidableAction(
                    onPressed: (context) {
                      //taskController.upDateTasks(String,);
                      Get.to(() => TaskEditPage(), arguments: task,);
                    },
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    icon: Icons.edit,
                    label: 'Edit',
                  ),
                ],
              ),
              child:  Card(
            color: index.isEven ? Colors.grey.shade200 : Colors.white,
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ListTile(
                contentPadding: const EdgeInsets.all(12),
                title: Text(
                  task.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (task.detail.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(task.detail),
                      ),
                    if (task.imagePath != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Image.file(
                          File(task.imagePath!),
                          height: 120,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                  ],
                ),
              ),
            ),

            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton( backgroundColor: Colors.black,
        onPressed: () {
          Get.toNamed(AppRoutes.TASK_REGISTRATION);
        },
        child: Icon(Icons.add,color: Colors.white,size: 30,),
      ),
    );
  }
}
