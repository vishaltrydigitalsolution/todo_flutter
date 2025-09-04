import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/pages/controller/task_controller.dart';
import 'package:todo/pages/routes/app_routes.dart';

class TaskRegisterPage extends StatelessWidget {
  TaskRegisterPage({super.key});
 // _TaskRegisterPageState createState()=>_TaskRegisterPageState();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController detailController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TaskController taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.toNamed(AppRoutes.TASK_PAGE);
          },
          icon: Icon(Icons.arrow_back, size: 32),
        ),
        title: Text(
          'Task register Page',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'Enter your Name',
                  labelText: 'Name',
                  labelStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: detailController,
                decoration: InputDecoration(
                  icon: Icon(Icons.details),
                  hintText: 'Enter your project detail',
                  labelText: 'Detail',
                  labelStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                  }
                  return null;

                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {

                  }
                  if (nameController.text.isNotEmpty &&
                      detailController.text.isNotEmpty) {
                    taskController.addTask(
                      nameController.text,
                      detailController.text,
                    );
                    nameController.clear();
                    detailController.clear();
                    Get.toNamed(AppRoutes.TASK_PAGE);
                  }
                },
                child: Text('Submit', style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

