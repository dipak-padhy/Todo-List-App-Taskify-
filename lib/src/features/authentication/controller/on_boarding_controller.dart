import 'package:get/get.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';

import '../../../constants/colors.dart';
import '../../../constants/image_strings.dart';
import '../../../constants/text_strings.dart';
import '../models/model_on_boarding.dart';
import '../screens/on_boarding/on_boarding_page_widget.dart';

class OnBoardingController extends GetxController {
  final controller = LiquidController();
  RxInt currentpage = 0.obs;

  final pages = [
    OnBoardingWidget(
        model: OnBoardingModel(
      todoOnBoardingImageSlide1,
      todoOnBoardingsubtitle,
      todoOnBoardingTitle1,
      todoOnBoardingButton1,
      todoOnBoardingButton2,
    )),
    OnBoardingWidget(
        model: OnBoardingModel(
      todoOnBoardingImageSlide2,
      todoOnBoardingsubtitle,
      todoOnBoardingTitle2,
      todoOnBoardingButton1,
      todoOnBoardingButton2,
    )),
    OnBoardingWidget(
        model: OnBoardingModel(
      todoOnBoardingImageSlide3,
      todoOnBoardingsubtitle,
      todoOnBoardingTitle3,
      todoOnBoardingButton1,
      todoOnBoardingButton2,
    )),
  ];
  onPageChangedCallBack(int activePageIndex) {
    currentpage.value = activePageIndex;
  }
}
