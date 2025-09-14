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
    return Obx(() => Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
         taskController.isMultiSelectionMode.value
              ? '${taskController.tasks.where((task) => task.isSelected.value).length} selected page'
              : 'Task page',
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
        actions: [
          if (taskController.isMultiSelectionMode.value)...[
            if (taskController.hasSelectedTasks)
              IconButton(
                onPressed: () {
                  taskController.deleteSelectedTasks();
                },
                icon: const Icon(Icons.delete, color: Colors.black),
              ),
            const SizedBox(width: 10),
            IconButton(
              onPressed: () {
                taskController.toggleSelectAll();
              },
              icon: Icon(
                taskController.tasks.every((task) => task.isSelected.value)
                    ? Icons.deselect
                    : Icons.select_all,
                color: Colors.black,
              ),
            ),
            IconButton(
              onPressed: () {
                taskController.clearSelection();
              },
              icon: const Icon(Icons.clear, color: Colors.black),
            ),
          ] else
            IconButton(
              onPressed: () {
                taskController.toggleMultiSelectionMode();
              },
              icon: const Icon(Icons.select_all, color: Colors.black),
            )
        ],
      ),
      body: ListView.builder(
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
                    Get.to(() => TaskEditPage(), arguments: task);
                  },
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  icon: Icons.edit,
                  label: 'Edit',
                ),
              ],
            ),
            child: Card(
              color: index.isEven ? Colors.grey[200] : Colors.white,
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                title: Text(
                  task.name,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                subtitle: Text(
                  task.detail,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                trailing: taskController.isMultiSelectionMode.value
                    ? Checkbox(
                  value: task.isSelected.value,
                  onChanged: (value) {
                    taskController.taskSelect(task);
                  },
                )
                    : null,
                leading: task.imagePath != null
                    ? Image.file(
                  File(task.imagePath!),
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                )
                    : null,
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          Get.toNamed(AppRoutes.TASK_REGISTRATION);
        },
        child:  const Icon(Icons.add, color: Colors.white, size: 30),
      ),
    ));
  }
}
