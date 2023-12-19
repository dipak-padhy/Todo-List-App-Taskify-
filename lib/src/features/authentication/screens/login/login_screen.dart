import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_list/src/features/authentication/controller/login_controller.dart';
import 'package:todo_list/src/features/authentication/controller/setting_controller.dart';
import 'package:todo_list/src/features/authentication/screens/sign_up/sign_up_screen.dart';

import '../../../../common_widgets/form/form_header_widget.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/text_strings.dart';

class TodoLogin extends StatelessWidget {
  TodoLogin({super.key});

  final loginController = Get.put(LoginController());
  final _loginFormkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FormHeaderWidget(
                  title: todoLoginTitle,
                  subtitle: todoLoginSubtitle,
                ),
                SizedBox(
                  height: 48.sp,
                ),
                Container(
                  padding: EdgeInsets.zero,
                  //  color: Colors.blue,
                  child: Column(
                    children: [
                      //    const Center(child: Image(image: AssetImage("assets/images/vecteezy_cloud-computing-modern-flat-concept-for-web-banner-design_5879539-removebg-preview.png",),height: 204,)),
                      Form(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        key: _loginFormkey,
                        child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                                validator: (value) {
                                if (value!.isEmpty) {
                                  return todoSignUpError1forTextfield2;
                                } else if (value.isNotEmpty &&
                                    !RegExp(r'^[\w-.]+@([\w-]+\.)+\w{2,4}')
                                        .hasMatch(value)) {
                                  return todoSignUpError2forTextfield2;
                                } else {
                                  return null;
                                }
                              },
                              controller: loginController.emailController,
                              keyboardType: TextInputType.emailAddress,
                              style: const TextStyle(
                                  fontFamily: 'Satoshi',
                                  fontWeight: FontWeight.w200,
                                  fontSize: 20,
                                  color: todoSecondaryColor),
                              textCapitalization: TextCapitalization.sentences,
                              cursorColor: todoPrimaryColor,
                              decoration: const InputDecoration(
                                /*  suffixIcon: Obx(
                                  () => IconButton(
                                    icon: Visibility(
                                      visible:
                                          obcontroller.isVisibleforField2.value,
                                      replacement: const Icon(
                                        Icons.check_circle,
                                      ),
                                      child: const Icon(
                                        Icons.cancel_outlined,
                                      ),
                                    ),
                                    onPressed: () {
                                      if (obcontroller.isVisibleforField2.value) {
                                        emailController.clear();
                                      }
                                    },
                                  ),
                                ),*/
                                suffixIcon: Icon(
                                  Icons.email_outlined,
                                  color: todoPrimaryColor,
                                ),
                                contentPadding:
                                    EdgeInsets.fromLTRB(24, 4, 12, 12),
                                label: Text(
                                  todoSignUpTextfield2,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: /*Obx(
                              () =>*/
                                TextFormField(
                              /*    validator: (value) {
                                  if (value!.isEmpty) {
                                    return todoSignUpError1forTextfield3;
                                  } else if (value.length < 6) {
                                    return todoSignUpError2forTextfield3;
                                  } else if (emailController.text
                                      .toString()
                                      .toLowerCase()
                                      .contains(value.toString().toLowerCase())) {
                                    return todoSignUpError3forTextfield3;
                                  } else {
                                    return null;
                                  }
                                },*/
                              controller: loginController.passwordController,
                              style: const TextStyle(
                                  fontFamily: 'Satoshi',
                                  fontWeight: FontWeight.w200,
                                  fontSize: 20,
                                  color: todoSecondaryColor),
                              textCapitalization: TextCapitalization.none,
                              cursorColor: todoPrimaryColor,
                              //  obscureText: obcontroller.isVisibleforField3.value,
                              decoration: const InputDecoration(
                                suffixIcon: /*IconButton(
                                    icon: Visibility(
                                      visible:
                                          obcontroller.isVisibleforField3.value,
                                      replacement: const Icon(
                                        Icons.remove_red_eye_outlined,
                                      ),
                                      child: const Icon(
                                        Icons.visibility_off_sharp,
                                      ),
                                    ),
                                    onPressed: () {
                                      if (obcontroller.isVisibleforField3.value) {
                                        obcontroller
                                            .setVisibilitytoFalseforField3();
                                      } else {
                                        obcontroller.setVisibilitytoTrueforField3();
                                      }
                                    },
                                  ),*/
                                    Icon(
                                  Icons.password,
                                  color: todoPrimaryColor,
                                ),
                                contentPadding:
                                    EdgeInsets.fromLTRB(24, 4, 12, 12),
                                label: Text(
                                  todoSignUpTextfield3,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              MaterialButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "Forgot Password?",
                                    style: TextStyle(
                                      color: todoPrimaryColor,
                                      fontFamily: 'Satoshi',
                                    ),
                                  )),
                            ],
                          ),
                          /* const SizedBox(
                            height: 12,
                          ),*/
                          /* Obx(() => CheckboxListTile(
                                value: obcontroller.isCheckedforCheckbox.value,
                                splashRadius: 0,
                                side: const BorderSide(
                                    color: todoSecondaryColor,
                                    width: 2,
                                    style: BorderStyle.solid,
                                    strokeAlign: BorderSide.strokeAlignInside),
                                onChanged: (value) =>
                                    obcontroller.setOnChangedforCheckbox(value!),
                                activeColor: todoPrimaryColor,
                                materialTapTargetSize: MaterialTapTargetSize.padded,
                                selectedTileColor: todoPrimaryColor,
                                contentPadding: EdgeInsets.zero,
                                title: const Text.rich(TextSpan(
                                  children: [
                                    TextSpan(
                                        text: "I accept ",
                                        style: TextStyle(
                                            color: todoSecondaryColor,
                                            fontFamily: 'Satoshi',
                                            fontWeight: FontWeight.w500)),
                                    TextSpan(
                                      text: "Terms of Use ",
                                      style: TextStyle(
                                        color: todoPrimaryColor,
                                        fontFamily: 'Satoshi',
                                      ),
                                    ),
                                    TextSpan(
                                        text: "and ",
                                        style: TextStyle(
                                            color: todoSecondaryColor,
                                            fontFamily: 'Satoshi',
                                            fontWeight: FontWeight.w500)),
                                    TextSpan(
                                        text: "Privacy Policy",
                                        style: TextStyle(
                                            color: todoPrimaryColor,
                                            fontFamily: 'Satoshi')),
                                  ],
                                )),
                                controlAffinity: ListTileControlAffinity.leading,
                                checkColor: todoSecondaryColor5,
                                dense: true,
                                visualDensity: VisualDensity.compact,
                              )),*/
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.black,
                                        spreadRadius: 2,
                                        offset: Offset(2.4, 3.2)),
                                  ]),
                              child: ElevatedButton(
                                /*icon: const Icon(
                                  Icons.login_sharp,

                                ),*/
                                onPressed: () async{
                                 loginController.loginUser(
                                          loginController.emailController.text.trim(),  loginController.passwordController.text.trim());
                                 await Settingcontroller.instance.getUserProfileData();
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.all(4),
                                  fixedSize: Size(344.sp, 44.sp),
                                  backgroundColor: todoPrimaryColor,
                                  foregroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                ),
                                /*label:*/ child: Text(
                                  "Log In",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontFamily: 'Satoshi',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 48.sp,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              children: [
                                const Expanded(
                                  child: Divider(
                                    color: todoSecondaryColor2,
                                    thickness: 0.5,
                                  ),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  "or continue with",
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontFamily: 'Satoshi',
                                    fontWeight: FontWeight.w300,
                                    color: todoSecondaryColor2,
                                  ),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                const Expanded(
                                  child: Divider(
                                    color: todoSecondaryColor2,
                                    thickness: 0.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 48,
                          ),
                          /* Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Expanded(
                                  child: Divider(
                                    color:todoSecondaryColor2,
                                    thickness: 0.5,
                                  ),
                                ),
                                const SizedBox(width: 4,),
                                Text("or continue with",style: TextStyle(
                                  fontSize: 12.sp,
                                  fontFamily: 'Satoshi',
                                  fontWeight: FontWeight.w300,
                                  color: todoSecondaryColor2,
                                ),),
                                const SizedBox(width: 4,),
                                const Expanded(
                                  child: Divider(
                                    color:todoSecondaryColor2,
                                    thickness: 0.5,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 24,
                                backgroundColor: todoSecondaryColor3,
                                child: Image(image: AssetImage("assets/logo/google.png"),width: 24,),
                              ),
                              SizedBox(width: 28,),
                              CircleAvatar(
                                radius: 24,
                                backgroundColor: todoSecondaryColor3,
                                child: Image(image: AssetImage("assets/logo/facebook.png"),width: 52,),
                              ),
                              SizedBox(width: 28,),
                              CircleAvatar(
                                radius: 24,
                                backgroundColor: todoSecondaryColor3,
                                child: Icon(Icons.apple_sharp,color: todoSecondaryColor,size: 28),
                              )
                            ],
                          )*/
                        ]),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => Get.snackbar(
                      "oops", "Currently this feature is under devlopment",
                      titleText: Text(
                        "Oops!",
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
                        "Currently this feature is under devlopment.",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: 'Satoshi',
                          // fontWeight: FontWeight.w400,
                        ),
                      ),
                      snackPosition: SnackPosition.TOP,
                      snackStyle: SnackStyle.FLOATING,
                      shouldIconPulse: true,
                      margin: const EdgeInsets.all(40)),
                  child: Container(
                      padding: EdgeInsets.zero,
                      //color: Colors.orange,
                      // height: 200,
                      child: Column(
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 24,
                                backgroundColor: todoSecondaryColor3,
                                child: Image(
                                  image: AssetImage("assets/logo/google.png"),
                                  width: 24,
                                ),
                              ),
                              SizedBox(
                                width: 28,
                              ),
                              CircleAvatar(
                                radius: 24,
                                backgroundColor: todoSecondaryColor3,
                                child: Image(
                                  image: AssetImage("assets/logo/facebook.png"),
                                  width: 52,
                                ),
                              ),
                              SizedBox(
                                width: 28,
                              ),
                              CircleAvatar(
                                radius: 24,
                                backgroundColor: todoSecondaryColor3,
                                child: Icon(Icons.apple_sharp,
                                    color: todoSecondaryColor, size: 28),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 84,
                          ),
                          MaterialButton(
                            onPressed: () {
                              Get.to(()=>const TodoSignUp(),
                                  transition: Transition.leftToRightWithFade,
                                  duration: const Duration(milliseconds: 550),
                                  curve: Curves.easeInOut);
                            },
                            child: const Text.rich(TextSpan(children: [
                              TextSpan(
                                  text: "Don't have an account? ",
                                  style: TextStyle(
                                    fontFamily: 'Satoshi',
                                  )),
                              TextSpan(
                                text: "Sign Up",
                                style: TextStyle(
                                  fontFamily: 'Satoshi',
                                  color: todoPrimaryColor,
                                ),
                              )
                            ])),
                          ),
                        ],
                      )),
                ),
              ]),
        ),
      ),
    ));
  }
}
