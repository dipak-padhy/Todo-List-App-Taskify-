import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import 'package:todo_list/src/repository/authentication_repository/authentication_repository.dart';
import 'package:todo_list/src/repository/user_repository/user_repository.dart';

class SignUpController extends GetxController{
  static SignUpController get instance => Get.find();
  RxBool isVisibleforField1 = true.obs;
  RxBool isVisibleforField2 = true.obs;
  RxBool isVisibleforField3= true.obs;
  RxBool isCheckedforCheckbox = false.obs;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final userRepo = Get.put(UserRepository());

  //Call this function from Design & it will do the rest
  void registerUser(username,email,password)  {
//    AuthenticationRepository.instance.addUsertodb(username,email,password);
    AuthenticationRepository.instance.createUserWithEmailAndPassword(username,email,password);
  }
/*
  void addUser(UserModel user) async {
    await  userRepo.createUser(user);
  }
*/

  setVisibilitytoTrueforField1(){
    isVisibleforField1.value = true;
  }
  setVisibilitytoFalseforField1(){
    isVisibleforField1.value = false;
  }
  setVisibilitytoTrueforField2(){
    isVisibleforField2.value = true;
  }
  setVisibilitytoFalseforField2(){
    isVisibleforField2.value = false;
  }
  setVisibilitytoTrueforField3(){
    isVisibleforField3.value = true;
  }
  setVisibilitytoFalseforField3(){
    isVisibleforField3.value = false;
  }
  setOnChangedforCheckbox(bool value){
    isCheckedforCheckbox.value=value;
  }
}