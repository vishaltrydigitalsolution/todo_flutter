import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/pages/controller/image_picker_controller.dart';
import 'package:todo/pages/controller/task_controller.dart';
import 'package:todo/pages/models/task_models.dart';
import 'package:image_picker/image_picker.dart';

class TaskEditPage extends StatelessWidget {
  const TaskEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ImagePickerController imageController = Get.put(
      ImagePickerController(),
    );
    final Task itemToEdit = Get.arguments as Task;
    final TextEditingController nameController = TextEditingController(
      text: itemToEdit.name,
    );
    final TextEditingController detailController = TextEditingController(
      text: itemToEdit.detail,
    );

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
                Get.find<TaskController>().tasks.refresh();

              },
              child: const Text('Save Changes'),
            ),

            Obx(
              () => CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: imageController.pickedImageFile.value != null
                    ? FileImage(imageController.pickedImageFile.value!)
                    : null,
              ),
            ),
            MaterialButton(
              color: Colors.red,
              child: Text('pick image'),
              onPressed: () {
                Get.bottomSheet(
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(leading: Icon(Icons.photo_album_outlined),
                          title: Text('choose from gallery'),
                      onTap: (){
                        imageController.pickImage(ImageSource.gallery);
                        Get.back();
                      },)
                    ],
                  ),
                );
              },
            ),

            MaterialButton(
              color: Colors.lightBlue,
              child: Text('image from camera', style: TextStyle(fontSize: 32)),
              onPressed: () {
                Get.bottomSheet(Column(mainAxisSize: MainAxisSize.min,children: [ListTile(leading: Icon(Icons.camera),
                title: Text('take a pick'),
                onTap: (){
                  imageController.pickImage(ImageSource.camera);
                },)],));
              },
            ),
          ],
        ),
      ),
    );
  }
}
