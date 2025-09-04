import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/pages/models/task_models.dart';

class TaskEditPage extends StatelessWidget {
  const TaskEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Task itemToEdit = Get.arguments as Task;
    final TextEditingController nameController =
    TextEditingController(text: itemToEdit.name);
    final TextEditingController detailController =
    TextEditingController(text: itemToEdit.detail);

    return Scaffold(
      appBar: AppBar(title: const Text('Edit Item')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                labelText: 'Name',
              ),
            ),
            TextFormField(
              controller: detailController,
              decoration: const InputDecoration(
                icon: Icon(Icons.details),
                labelText: 'Description',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                itemToEdit.name = nameController.text;
                itemToEdit.detail = detailController.text;
                Get.back(result: itemToEdit);
              },
              child: const Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}

