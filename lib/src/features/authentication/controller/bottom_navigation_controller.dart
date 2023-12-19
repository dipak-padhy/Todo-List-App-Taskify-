
import 'package:get/get.dart';
import 'package:todo_list/src/features/authentication/screens/add_task/add_task_screen.dart';
import 'package:todo_list/src/features/authentication/screens/calendar_screen/calendar_screen.dart';
import 'package:todo_list/src/features/authentication/screens/settings_screen/settings_screen.dart';

import '../screens/home_screen/home_screen.dart';

class BottomNavigationController extends GetxController {
  RxInt selectedIndex = 0.obs;

  void changeIndex(int index){
    selectedIndex.value = index;
  }



}

