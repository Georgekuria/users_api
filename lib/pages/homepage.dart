import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:users_api/controller/user_controller.dart';


class HomePage extends StatelessWidget {
   HomePage({super.key});

  UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),

      body: Obx(() {
        if(userController.userList.isEmpty) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else{
          return ListView.builder(
              itemCount: userController.userList.length,
              itemBuilder: (BuildContext context, int index) {
               var  user = userController.userList[index];
            return ListTile(
              title: Text("Name: ${user.name}"),
            );
          });
        }
      })
    );
  }
}
