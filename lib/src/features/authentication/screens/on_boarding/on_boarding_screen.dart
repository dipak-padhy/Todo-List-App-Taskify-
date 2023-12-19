import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_list/src/constants/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:todo_list/src/features/authentication/screens/navigation_screen/navigation_screen.dart';
import 'package:todo_list/src/features/authentication/screens/on_boarding/page_one.dart';
import 'package:todo_list/src/features/authentication/screens/on_boarding/page_three.dart';
import 'package:todo_list/src/features/authentication/screens/on_boarding/page_two.dart';
import 'package:todo_list/src/features/authentication/screens/sign_up/sign_up_screen.dart';

import '../../../../constants/text_strings.dart';
import '../login/login_screen.dart';



class OnBoardingScreen extends StatelessWidget {
 const OnBoardingScreen({super.key});









/*  isLogin(){
    final auth=FirebaseAuth.instance;
    final user=auth.currentUser;

    if(user!=null)
    {
      Get.offAll(const NavigationScreen());
    }
    else{

    }
  }*/


  @override
  Widget build(BuildContext context) {
    final controller = PageController();
   /* isLogin();*/
    return Scaffold(
      body: PageView(
        controller: controller,
       // physics: const AlwaysScrollableScrollPhysics(),
        children: const [
          PageOne(),
          PageTwo(),
          PageThree(),
          /*  Stack(
            alignment: Alignment.center,
            children: [
              LiquidSwipe(
                waveType: WaveType.circularReveal,
                onPageChangeCallback: obController.onPageChangedCallBack,
                liquidController: obController.controller,
                ignoreUserGestureWhileAnimating: true,
                pages: obController.pages,
              ),*/

          // ],
          //),
        ],
      ),
      bottomSheet: Container(
        color: todoPrimaryColor2,
        height: 220.sp,
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: SmoothPageIndicator(
                  effect: const ExpandingDotsEffect(
                      activeDotColor: todoPrimaryColor,
                      dotHeight: 12.0,
                      dotWidth: 12.0,
                      dotColor: todoSecondaryColor2,
                      // type: WormType.thin,
                      spacing: 20),

                  // duration: const Duration(milliseconds: 150),
                  controller: controller,
                  count: 3,
                ),
              ),
              SizedBox(
                height: 36.sp,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black,
                          spreadRadius: 2,
                          offset: Offset(2.4, 3.2)),
                    ]),
                child: ElevatedButton(
                  onPressed: () {
                    Get.to( () => const TodoSignUp());
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(4),
                    fixedSize: Size(344.sp, 44.sp),
                    backgroundColor: todoPrimaryColor,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Text(
                    todoOnBoardingButton1,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: 'Satoshi',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const [
                      BoxShadow(
                          spreadRadius: 2,
                          color: Colors.black,
                          offset: Offset(2.4, 3.2)),
                    ]),
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() =>TodoLogin());
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(4),
                    fixedSize: Size(344.sp, 44.sp),
                    backgroundColor: todoSecondaryColor,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Text(
                    todoOnBoardingButton2,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: 'Satoshi',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//two containers //
/*
               */
