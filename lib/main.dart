import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/binding/task_binding.dart';
import 'package:todo/pages/routes/app_routes.dart';
import 'package:todo/pages/task_edit_page.dart';
import 'package:todo/pages/task_page.dart';
import 'package:todo/pages/task_register_page.dart';
import 'package:get/route_manager.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
   // Get.put(TaskController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo app',
      initialRoute: AppRoutes.TASK_PAGE,
      getPages: [
        GetPage(name: AppRoutes.TASK_PAGE, page: () => TaskPage(),binding: TaskBinding() ),
        GetPage(name: AppRoutes.TASK_REGISTRATION, page: () => TaskRegisterPage(),binding: TaskBinding()),
        GetPage(name: AppRoutes.TaskEditPage, page: () => TaskEditPage(),binding: TaskBinding()),
      ],
    );
  }
}
