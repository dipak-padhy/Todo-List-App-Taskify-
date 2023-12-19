import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_list/src/features/authentication/screens/login/login_screen.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/text_strings.dart';

class SignUpFooterWidget extends StatelessWidget {
  const SignUpFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        //color: Colors.red,
        width: 356.sp,
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                      icon: const Image(image: AssetImage("assets/logo/google.png"),width: 24),
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
                        fixedSize: Size(148.sp, 44.sp),
                        backgroundColor: todoSecondaryColor,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      label: const Text(
                        "",
                      ),
                    ),
                  ),
                ),
               // SizedBox(width: 12.sp,),
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
                      icon: const Image(image: AssetImage("assets/logo/facebook.png"),width: 52,),
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
                        fixedSize: Size(148.sp, 44.sp),
                        backgroundColor: todoSecondaryColor,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      label: const Text(
                        "",
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4,),
            /*Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                    todoSignUpReferencetoLogin,
                    style: TextStyle(
                      fontFamily: 'Satoshi',
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: TextButton(
                    onPressed:   (){}                          ,
                    child:const Text( "Log In",
                      style:  TextStyle(
                        fontFamily: 'Satoshi',
                        color: todoPrimaryColor,
                      ),
                    ),
                  ),
                )],
            ),*/
             MaterialButton(
               onPressed: (){
                 Get.to(()=> TodoLogin(),transition: Transition.leftToRightWithFade,duration:const Duration(milliseconds: 550),curve: Curves.easeInOut);
               },
               child: const Text.rich(TextSpan(
                children:[
                  TextSpan(
                    text: todoSignUpReferencetoLogin,
                    style: TextStyle(
                      fontFamily: 'Satoshi',
                    )
                  ),
                  TextSpan(
                    text: "  Log In",
                    style:  TextStyle(
                      fontFamily: 'Satoshi',
                      color: todoPrimaryColor,
                    ),
                  )
                ]
            )),
             )
          ],
        ),

      ),
    );
  }
}