
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_list/src/features/authentication/models/users_model.dart';
import 'package:todo_list/src/features/authentication/screens/navigation_screen/navigation_screen.dart';
import 'package:todo_list/src/features/authentication/screens/on_boarding/on_boarding_screen.dart';

import '../../constants/colors.dart';
import '../user_repository/user_repository.dart';
import 'exceptions/login_email_password_failuer.dart';
import 'exceptions/signup_email_password_failure.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //Variables
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  final userRepo = Get.put(UserRepository());
  final _db = FirebaseFirestore.instance;


  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const OnBoardingScreen())
        : Get.offAll(() => const NavigationScreen());
  }

  Future<void> updateTask( String id,String title, String desc, String category,String date,String st,String et,String reminder)async {
    try{
      await FirebaseFirestore.instance.collection('Tasks').doc(id).update(
          {
            "Title": title,
            "Description": desc,
            "Category":category,
            "Date":date,
            "StartTime":st,
            "EndTime":et,
            "Reminder":reminder,
          }
      ).whenComplete(() => Get.snackbar("oops", "Currently this feature is under devlopment",
          titleText: Text(
            "Success",
            style: TextStyle(
              color: todoPrimaryColor,
              fontSize: 12.sp,
              fontFamily: 'Satoshi',
              fontWeight: FontWeight.w200,
            ),
          ),
          isDismissible: true,
          duration: const Duration(milliseconds: 1800),
          messageText: Text(
            "Your Task has been updated.",
            style: TextStyle(
              fontSize: 16.sp,
              fontFamily: 'Satoshi',
              // fontWeight: FontWeight.w400,
            ),
          ),
          snackPosition: SnackPosition.TOP,
          snackStyle: SnackStyle.FLOATING,
          shouldIconPulse: true,
          margin: const EdgeInsets.all(40)));
    }catch (error){
      log("------------------------------>this is the updating task error:- $error");
    }
  }
  Future<void> deleteTask(
      String id) async {
    try{
      await _db.collection('Tasks').doc(id).delete().whenComplete(() =>  Get.snackbar("oops", "Currently this feature is under devlopment",
          titleText: Text(
            "Success",
            style: TextStyle(
              color: todoPrimaryColor,
              fontSize: 12.sp,
              fontFamily: 'Satoshi',
              fontWeight: FontWeight.w200,
            ),
          ),
          isDismissible: true,
          duration: const Duration(milliseconds: 1800),
          messageText: Text(
            "Your Task has been deleted.",
            style: TextStyle(
              fontSize: 16.sp,
              fontFamily: 'Satoshi',
              // fontWeight: FontWeight.w400,
            ),
          ),
          snackPosition: SnackPosition.TOP,
          snackStyle: SnackStyle.FLOATING,
          shouldIconPulse: true,
          margin: const EdgeInsets.all(40)));
      }catch (error){
      log("------------------------------>this is the adding task error:- $error");
    }
    }

  Future<void> addTaskToDb(
      String title, String desc, String category,String date,String st,String et,String reminder) async {
   // var uuid = const Uuid().v4();
    User? user = FirebaseAuth.instance.currentUser;
    final docID = _db.collection('Tasks').doc();

    try{
      await docID.set({
        'Title': title,
        'Description': desc,
        'Category': category,
        'Date': date,
        'StartTime': st,
        'EndTime': et,
        'id':docID.id,
        'Reminder': reminder,
        'uid': user!.uid,
      }
      ).whenComplete(() =>  Get.snackbar("oops", "Currently this feature is under devlopment",
          titleText: Text(
            "Success",
            style: TextStyle(
              color: todoPrimaryColor,
              fontSize: 12.sp,
              fontFamily: 'Satoshi',
              fontWeight: FontWeight.w200,
            ),
          ),
          isDismissible: true,
          duration: const Duration(milliseconds: 1800),
          messageText: Text(
            "Your Task has been created.",
            style: TextStyle(
              fontSize: 16.sp,
              fontFamily: 'Satoshi',
              // fontWeight: FontWeight.w400,
            ),
          ),
          snackPosition: SnackPosition.TOP,
          snackStyle: SnackStyle.FLOATING,
          shouldIconPulse: true,
          margin: const EdgeInsets.all(40)));
    }catch (error){
      log("------------------------------>this is the adding task error:- $error");
    }

  }

/*  Future getTaskList() async {
    try{
      await taskList.do
    }catch{

    }
}*/

  void adduser(UserModel user) async {
    await userRepo.createUser(user);
  }

 /* Future<void> updateTaskDetails() async{
    await _db.
  }
*/

  Future<void> createUserWithEmailAndPassword(
      String name, String email, String password) async {
    try {

      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = FirebaseAuth.instance.currentUser;

      await _db.collection("Users").doc(user!.uid).set({
        'username': name,
        'email': email,
        'uid': user.uid,
      }).whenComplete(() =>  Get.snackbar("oops", "Currently this feature is under devlopment",
          titleText: Text(
            "Success",
            style: TextStyle(
              color: todoPrimaryColor,
              fontSize: 12.sp,
              fontFamily: 'Satoshi',
              fontWeight: FontWeight.w200,
            ),
          ),
          isDismissible: true,
          duration: const Duration(milliseconds: 1800),
          messageText: Text(
            "Your account has been created.",
            style: TextStyle(
              fontSize: 16.sp,
              fontFamily: 'Satoshi',
              // fontWeight: FontWeight.w400,
            ),
          ),
          snackPosition: SnackPosition.TOP,
          snackStyle: SnackStyle.FLOATING,
          shouldIconPulse: true,
          margin: const EdgeInsets.all(40)));


        //  ------------------------------------------------------------------->
        /*  Get.snackbar("Success", "Your account has been created.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green.withOpacity(0.1),
          colorText: todoPrimaryColor),);*/

   //   log(response.toString());
      firebaseUser.value != null
          ? Get.offAll(() =>  const NavigationScreen())
          : Get.offAll(() => const OnBoardingScreen());
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailPasswordFailure.code(e.code);
      Get.snackbar("oops", "Currently this feature is under devlopment",
          titleText: Text(
            "Error!",
            style: TextStyle(
              color: todoPrimaryColor,
              fontSize: 12.sp,
              fontFamily: 'Satoshi',
              fontWeight: FontWeight.w200,
            ),
          ),
          isDismissible: true,
          duration: const Duration(milliseconds: 1800),
          messageText: Text(
            ex.message,
            style: TextStyle(
              fontSize: 16.sp,
              fontFamily: 'Satoshi',
              // fontWeight: FontWeight.w400,
            ),
          ),
          snackPosition: SnackPosition.TOP,
          snackStyle: SnackStyle.FLOATING,
          shouldIconPulse: true,
          margin: const EdgeInsets.all(40));
      throw ex;
    } catch (_) {
      const ex = SignUpWithEmailPasswordFailure();
      Get.snackbar("oops", "Currently this feature is under devlopment",
          titleText: Text(
            "Error!",
            style: TextStyle(
              color: todoPrimaryColor,
              fontSize: 12.sp,
              fontFamily: 'Satoshi',
              fontWeight: FontWeight.w200,
            ),
          ),
          isDismissible: true,
          duration: const Duration(milliseconds: 1800),
          messageText: Text(
            ex.message,
            style: TextStyle(
              fontSize: 16.sp,
              fontFamily: 'Satoshi',
              // fontWeight: FontWeight.w400,
            ),
          ),
          snackPosition: SnackPosition.TOP,
          snackStyle: SnackStyle.FLOATING,
          shouldIconPulse: true,
          margin: const EdgeInsets.all(40));
      throw ex;
    }
  }



  Future<void> loginUserWithEmailAndPassword(
      String email, String password) async {
    try {


      await _auth.signInWithEmailAndPassword(email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() =>  const NavigationScreen())
          : Get.offAll(() => const OnBoardingScreen());
    } on FirebaseAuthException catch (e){
      final ex = LoginWithEmailPasswordFailure.code(e.code);
      Get.snackbar("oops", "Currently this feature is under devlopment",
          titleText: Text(
            "Error!",
            style: TextStyle(
              color: todoPrimaryColor,
              fontSize: 12.sp,
              fontFamily: 'Satoshi',
              fontWeight: FontWeight.w200,
            ),
          ),
          isDismissible: true,
          duration: const Duration(milliseconds: 1800),
          messageText: Text(
            ex.message,
            style: TextStyle(
              fontSize: 16.sp,
              fontFamily: 'Satoshi',
              // fontWeight: FontWeight.w400,
            ),
          ),
          snackPosition: SnackPosition.TOP,
          snackStyle: SnackStyle.FLOATING,
          shouldIconPulse: true,
          margin: const EdgeInsets.all(40));
      throw ex;
    }
    catch (_) {
      const ex = LoginWithEmailPasswordFailure();
      Get.snackbar("oops", "Currently this feature is under devlopment",
          titleText: Text(
            "Error!",
            style: TextStyle(
              color: todoPrimaryColor,
              fontSize: 12.sp,
              fontFamily: 'Satoshi',
              fontWeight: FontWeight.w200,
            ),
          ),
          isDismissible: true,
          duration: const Duration(milliseconds: 1800),
          messageText: Text(
            ex.message,
            style: TextStyle(
              fontSize: 16.sp,
              fontFamily: 'Satoshi',
              // fontWeight: FontWeight.w400,
            ),
          ),
          snackPosition: SnackPosition.TOP,
          snackStyle: SnackStyle.FLOATING,
          shouldIconPulse: true,
          margin: const EdgeInsets.all(40));
      throw ex;
    }
  }

  Future<void> logout() async {
   // firebaseUser.value == null;
    await _auth.signOut();

  }


}

