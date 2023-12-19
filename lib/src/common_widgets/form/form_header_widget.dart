import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_list/src/features/authentication/screens/on_boarding/on_boarding_screen.dart';

import '../../constants/colors.dart';

class FormHeaderWidget extends StatelessWidget {
  const FormHeaderWidget(
      {super.key, required this.title, required this.subtitle});

  final String title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       /* SizedBox(
          height: 4.sp,
        ),*/
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              padding:EdgeInsets.zero,
                onPressed: (){
                 Get.to(const OnBoardingScreen());
                },
               icon: const Icon(Icons.arrow_back_sharp),
            )],
        ),
        SizedBox(
          height:16.sp,
        ),
            Padding(
              padding: const EdgeInsets.only(left:8.0),
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: 'Satoshi',
                  fontWeight: FontWeight.w400,
                  fontSize: 24.sp,
                  color: todoPrimaryColor,
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                subtitle,
                style: TextStyle(
                  fontFamily: 'Satoshi',
                  fontWeight: FontWeight.w100,
                  fontSize: 12.4.sp,
                  color: todoSecondaryColor2,
                ),
              ),
            ),


      ],
    );
  }
}
