import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:todo_list/src/features/authentication/models/task_model.dart';

class homeScreenController extends GetxController {
  static homeScreenController get instance => Get.find();

  final user = FirebaseAuth.instance.currentUser;
  List loginUserData = [];

  Future<void> getLoginUserProduct() async {

    try {
     List lodadedProduct = [];
      var response = await FirebaseFirestore.instance
          .collection('productlist')
          .where('uid', isEqualTo: user)
          .get();
      if (response.docs.isNotEmpty) {
        for (var result in response.docs) {
            lodadedProduct.add(
                TaskModel(
              taskId: result.id,
              taskTitle: result['Title'],
              taskDescription: result['Description'],
              taskCategory: result['Category'],
              taskDate: (result['Date']),
              taskSt: result['StartTime'],
              taskEt: result['EndTime'],
              taskReminder: result['Reminder'],
           ));
          }
        log("length :- ${lodadedProduct.length}");
      }
      loginUserData.addAll(lodadedProduct);
      update();
    } on FirebaseException catch (e) {
      print("Error $e");
    } catch (error) {
      print("error $error");
    }
  }
}
