import 'package:flutter/Material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/text_strings.dart';
import '../../../controller/sign_up_controller.dart';
import '../../../models/users_model.dart';

class SignUpFormWidget extends StatelessWidget {
  SignUpFormWidget({super.key});

  final supcontroller =Get.put(SignUpController());
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: _formkey,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              maxLength: 20,
              validator: (value) {
                if (value!.isEmpty) {
                  supcontroller.setVisibilitytoTrueforField1();
                  return todoSignUpError1forTextfield1;
                } else if (value.isNotEmpty &&
                    !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                  supcontroller.setVisibilitytoTrueforField1();
                  return todoSignUpError2forTextfield1;
                } else if (value.length < 2) {
                  supcontroller.setVisibilitytoTrueforField1();
                  return todoSignUpError3forTextfield1;
                } else {
                  supcontroller.setVisibilitytoFalseforField1();
                  return null;
                }
              },
              controller: supcontroller.nameController,
              style: const TextStyle(
                  fontFamily: 'Satoshi',
                  fontWeight: FontWeight.w200,
                  fontSize: 20,
                  color: todoSecondaryColor),
              textCapitalization: TextCapitalization.words,
              cursorColor: todoPrimaryColor,
              showCursor: true,
              decoration: InputDecoration(
                suffixIcon: Obx(
                  () => IconButton(
                    icon: Visibility(
                      visible: supcontroller.isVisibleforField1.value,
                      replacement: const Icon(
                        Icons.check_circle,
                      ),
                      child: const Icon(
                        Icons.cancel_outlined,
                      ),
                    ),
                    onPressed: () {
                      if (supcontroller.isVisibleforField1.value) {
                        supcontroller.nameController.clear();
                      }
                    },
                  ),
                ),
                contentPadding: const EdgeInsets.fromLTRB(24, 4, 12, 12),
                label: const Text(
                  todoSignUpTextfield1,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  supcontroller.setVisibilitytoTrueforField2();
                  return todoSignUpError1forTextfield2;
                } else if (value.isNotEmpty &&
                    !RegExp(r'^[\w-.]+@([\w-]+\.)+\w{2,4}').hasMatch(value)) {
                  supcontroller.setVisibilitytoTrueforField2();
                  return todoSignUpError2forTextfield2;
                } else {
                  supcontroller.setVisibilitytoFalseforField2();
                  return null;
                }
              },
              controller: supcontroller.emailController,
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(
                  fontFamily: 'Satoshi',
                  fontWeight: FontWeight.w200,
                  fontSize: 20,
                  color: todoSecondaryColor),
              textCapitalization: TextCapitalization.sentences,
              cursorColor: todoPrimaryColor,
              decoration: InputDecoration(
                suffixIcon: Obx(
                  () => IconButton(
                    icon: Visibility(
                      visible: supcontroller.isVisibleforField2.value,
                      replacement: const Icon(
                        Icons.check_circle,
                      ),
                      child: const Icon(
                        Icons.cancel_outlined,
                      ),
                    ),
                    onPressed: () {
                      if (supcontroller.isVisibleforField2.value) {
                        supcontroller.emailController.clear();
                      }
                    },
                  ),
                ),
                contentPadding: const EdgeInsets.fromLTRB(24, 4, 12, 12),
                label: const Text(
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
            child: Obx(
              () => TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return todoSignUpError1forTextfield3;
                  } else if (value.length < 6) {
                    return todoSignUpError2forTextfield3;
                  } else if (supcontroller.emailController.text
                      .toString()
                      .toLowerCase()
                      .contains(value.toString().toLowerCase())) {
                    return todoSignUpError3forTextfield3;
                  } else {
                    return null;
                  }
                },
                controller: supcontroller.passwordController,
                style: const TextStyle(
                    fontFamily: 'Satoshi',
                    fontWeight: FontWeight.w200,
                    fontSize: 20,
                    color: todoSecondaryColor),
                textCapitalization: TextCapitalization.none,
                cursorColor: todoPrimaryColor,
                obscureText: supcontroller.isVisibleforField3.value,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Visibility(
                      visible: supcontroller.isVisibleforField3.value,
                      replacement: const Icon(
                        Icons.remove_red_eye_outlined,
                      ),
                      child: const Icon(
                        Icons.visibility_off_sharp,
                      ),
                    ),
                    onPressed: () {
                      if (supcontroller.isVisibleforField3.value) {
                        supcontroller.setVisibilitytoFalseforField3();
                      } else {
                        supcontroller.setVisibilitytoTrueforField3();
                      }
                    },
                  ),
                  contentPadding: const EdgeInsets.fromLTRB(24, 4, 12, 12),
                  label: const Text(
                    todoSignUpTextfield3,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Obx(() => CheckboxListTile(
                value: supcontroller.isCheckedforCheckbox.value,
                splashRadius: 0,
                side: const BorderSide(
                    color: todoSecondaryColor,
                    width: 2,
                    style: BorderStyle.solid,
                    strokeAlign: BorderSide.strokeAlignInside),
                onChanged: (value) =>
                    supcontroller.setOnChangedforCheckbox(value!),
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
                            color: todoPrimaryColor, fontFamily: 'Satoshi')),
                  ],
                )),
                controlAffinity: ListTileControlAffinity.leading,
                checkColor: todoSecondaryColor5,
                dense: true,
                visualDensity: VisualDensity.compact,
              )),
          const SizedBox(
            height: 36,
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
              child: ElevatedButton.icon(
                icon: const Icon(
                  Icons.email_sharp,
                ),
                onPressed: () {
                  if(_formkey.currentState!.validate()){

                  /*  final user = UserModel(
                      username: supcontroller.nameController.text.trim(),
                      email :supcontroller.emailController.text.trim(),
                    ) ;*/
                    SignUpController.instance.registerUser( supcontroller.nameController.text.trim(),supcontroller.emailController.text.trim(),supcontroller.passwordController.text.trim());

                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(4),
                  fixedSize: Size(344.sp, 44.sp),
                  backgroundColor: todoPrimaryColor,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                label: Text(
                  todoSignUpEmailButton,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: 'Satoshi',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: const [
                    BoxShadow(
                        spreadRadius: 2,
                        color: Colors.black,
                        offset: Offset(2.4, 3.2)),
                  ]),
              child: ElevatedButton.icon(
                icon: const Icon(
                  Icons.apple_sharp,
                  color: todoSecondaryColor,
                ),
                onPressed: () {
                  Get.snackbar(
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
                      margin: const EdgeInsets.all(40));
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(4),
                  fixedSize: Size(344.sp, 44.sp),
                  backgroundColor: todoSecondaryColor6,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                label: Text(
                  todoSignUpAppleIdButton,
                  style: TextStyle(
                    color: todoSecondaryColor,
                    fontSize: 16.sp,
                    fontFamily: 'Satoshi',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
