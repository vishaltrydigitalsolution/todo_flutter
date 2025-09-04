import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/pages/models/task_models.dart';

class TaskEditPage extends StatefulWidget {
  const TaskEditPage({super.key});
  _TaskEditPageState createState() => _TaskEditPageState();
}
class _TaskEditPageState extends State<TaskEditPage> {
  late Task itemToEdit;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _detailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    itemToEdit = Get.arguments;
    _nameController.text = itemToEdit.name;
    _detailController.text = itemToEdit.detail;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Item')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  labelText: 'Name'),
            ),
            TextFormField(
              controller: _detailController,
              decoration: InputDecoration(
                  icon: Icon(Icons.details),
                  labelText: 'Description'),
            ),
            ElevatedButton(
              onPressed: () {
                itemToEdit.name = _nameController.text;
                itemToEdit.detail = _detailController.text;

                Get.back(result: itemToEdit);

              },
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
  @override
  void dispose() {
    _nameController.dispose();
    _detailController.dispose();
    super.dispose();
  }
}



