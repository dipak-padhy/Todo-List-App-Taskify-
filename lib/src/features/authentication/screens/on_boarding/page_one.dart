import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_list/src/constants/image_strings.dart';
import 'package:todo_list/src/constants/text_strings.dart';

import '../../../../constants/colors.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    final size  = MediaQuery.of(context).size;

    return Scaffold(
      body:  Container(
        padding: EdgeInsets.all(12.sp),
        color:todoPrimaryColor2,
        child: Column(
          children: [
            SizedBox(
              height: 60.sp,
            ),
            Image(image: const AssetImage(todoOnBoardingImageSlide1),height: size.height * 0.38.sp,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(todoOnBoardingsubtitle,style: TextStyle(
                  fontSize: 12.sp,
                  fontFamily: 'Satoshi',
                  fontWeight: FontWeight.w300,
                  color: todoPrimaryColor,
                ),),
                SizedBox(height: 8.sp,),
                Text(todoOnBoardingTitle1,style: TextStyle(
                    fontSize: 32.sp,
                    fontFamily: 'Satoshi',
                    fontWeight: FontWeight.w500,
                    color: todoSecondaryColor
                ),),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
