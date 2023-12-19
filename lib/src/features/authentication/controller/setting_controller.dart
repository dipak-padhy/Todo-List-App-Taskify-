import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:todo_list/src/features/authentication/screens/home_screen/home_screen.dart';

class Settingcontroller extends GetxController{

  static Settingcontroller get instance => Get.find();
  RxMap userProfileData = {'username': '', 'email': ''}.obs;

    Future<void> getUserProfileData() async {
      try {
        var response = await FirebaseFirestore.instance
            .collection('Users').where('uid', isEqualTo: user!.uid).get();
        if (response.docs.isNotEmpty) {
          userProfileData['username'] = response.docs[0]['username'];
          userProfileData['email'] = response.docs[0]['email'];
        }
        print("--------------------------------------------------------------------------------------");
        log(userProfileData.toString());
      } on FirebaseException catch (e) {
        print(e);
      } catch (error) {
        print(error);
      }
    }


}