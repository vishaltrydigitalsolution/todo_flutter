import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo/pages/controller/image_picker_controller.dart';
import 'package:todo/pages/controller/task_controller.dart';
import 'package:todo/pages/routes/app_routes.dart';

class TaskRegisterPage extends StatelessWidget {
  TaskRegisterPage({super.key});
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController detailController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TaskController taskController = Get.put(TaskController());
  final ImagePickerController imageController = Get.put(
    ImagePickerController(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Task register Page',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            onPressed: () {
              imageController.pickImage(ImageSource.camera);
            },
            icon: Icon(Icons.camera),
          ),
          IconButton(
            onPressed: () {
              imageController.pickImage(ImageSource.gallery);
            },
            icon: Icon(Icons.photo),
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Obx(
                    () => CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.white,
                  backgroundImage: imageController.pickedImageFile.value != null
                      ? FileImage(imageController.pickedImageFile.value!)
                      : null,
                ),
              ),
              TextFormField(style: TextStyle(fontSize: 23),
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
                  if (value == null || value.isEmpty) {}
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(style: TextStyle(fontSize: 23),
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
                  if (value == null || value.isEmpty) {}
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {}
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
