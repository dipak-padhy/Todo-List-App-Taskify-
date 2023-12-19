import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import 'package:todo_list/src/repository/authentication_repository/authentication_repository.dart';

class LoginController extends GetxController{
  static LoginController get instance => Get.find();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void loginUser(String email,String password){
    AuthenticationRepository.instance.loginUserWithEmailAndPassword(email, password);
  }
}