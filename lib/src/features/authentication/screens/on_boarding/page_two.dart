import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/text_strings.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final size  = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(12.sp),
        color: todoPrimaryColor2,
        child: Column(
          children: [
            SizedBox(
              height: 60.sp,
            ),
            Image(image: const AssetImage(todoOnBoardingImageSlide2),height: size.height * 0.38.sp,),
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
                Text(todoOnBoardingTitle2,style: TextStyle(
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
