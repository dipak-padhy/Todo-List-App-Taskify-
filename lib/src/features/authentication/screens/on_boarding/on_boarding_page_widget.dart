import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/colors.dart';
import '../../models/model_on_boarding.dart';

class OnBoardingWidget extends StatelessWidget {

  const OnBoardingWidget({
    super.key,
    required this.model,
  });

  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
    final size  = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(12.sp),
     color: todoSecondaryColor3,
      child: Column(
        children: [
          SizedBox(
            height: 60.sp,
          ),
          Image(image: AssetImage(model.image),height: size.height * 0.38.sp,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(model.subhead,style: TextStyle(
                fontSize: 12.sp,
                fontFamily: 'Satoshi',
                fontWeight: FontWeight.w300,
                color: todoPrimaryColor,
              ),),
              SizedBox(height: 8.sp,),
              Text(model.title,style: TextStyle(
                  fontSize: 32.sp,
                  fontFamily: 'Satoshi',
                  fontWeight: FontWeight.w500,
                  color: todoSecondaryColor
              ),),
            ],
          ),
          SizedBox(
            height: 88.sp,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius : BorderRadius.circular(8),
                    boxShadow: const [
                      BoxShadow(
                          color: todoPrimaryColor2,
                          spreadRadius: 2,
                          offset: Offset(2.4,3.2)
                      ),]
                ),
                child:  ElevatedButton(onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(4),
                    fixedSize: Size(344.sp, 44.sp),
                    backgroundColor: todoPrimaryColor,
                    foregroundColor: todoPrimaryColor2,
                    side: const BorderSide(color: todoPrimaryColor2,width: 2),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Text(
                    model.button1,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: 'Satoshi',
                      fontWeight: FontWeight.w500,
                    ),
                  ),),
              ),

              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius : BorderRadius.circular(8),
                    boxShadow: const [
                      BoxShadow(
                          spreadRadius: 2,
                          color: todoPrimaryColor2,
                          offset: Offset(2.4,3.2)
                      ),]
                ),
                child:  ElevatedButton(onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(4),
                    fixedSize: Size(344.sp, 44.sp),
                    backgroundColor: todoSecondaryColor,
                    foregroundColor: todoPrimaryColor2,
                    side: const BorderSide(color: todoPrimaryColor2,width: 2),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Text(
                    model.button2,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: 'Satoshi',
                      fontWeight: FontWeight.w500,
                    ),
                  ),),
              ),
            ],
          ),
        ],
      ),
    );
  }
}