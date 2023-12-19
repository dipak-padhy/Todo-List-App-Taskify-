import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:todo_list/src/features/authentication/controller/bottom_navigation_controller.dart';
import 'package:todo_list/src/features/authentication/controller/setting_controller.dart';
import 'package:todo_list/src/features/authentication/screens/calendar_screen/calendar_screen.dart';
import 'package:todo_list/src/features/authentication/screens/settings_screen/settings_screen.dart';
import 'package:todo_list/src/features/authentication/screens/user_history_screen.dart';

import '../../../../constants/colors.dart';
import '../add_task/add_task_screen.dart';
import '../home_screen/home_screen.dart';

class NavigationScreen extends StatefulWidget {
   const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  BottomNavigationController bnController = Get.put(BottomNavigationController());
  Settingcontroller scontroller = Get.put(Settingcontroller());

  final screens = [
    const HomeScreen(),
  const CalendarScreen(),
  const AddTaskScreen(),
    const HistoryScreen(),
     SettingsScreen(),
  ] ;



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          ()=> IndexedStack(
            index: bnController.selectedIndex.value,
            children: screens,

          ),
        ),
        bottomNavigationBar:Container(
          color: todoPrimaryColor2,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 8.0),
            child: GNav(
               // tabMargin: const EdgeInsets.all(),
                duration: const Duration(milliseconds: 250),
                gap: 8,
                backgroundColor:todoPrimaryColor2,
                curve: Curves.easeInOut,
                padding: const EdgeInsets.all(12),
                onTabChange: (index) {
                 bnController.changeIndex(index);
                },
                tabBackgroundColor: todoPrimaryColor,
                activeColor: todoPrimaryColor2,
                tabs: [
                  const GButton(icon: Icons.home,),
                  const GButton(icon: Icons.calendar_month_outlined,),
                  GButton(
                    icon: Icons.add,
                    border: Border.all(color: todoPrimaryColor,width: 2.3),
                    borderRadius: BorderRadius.circular(100),iconSize: 40,
                  ),
                  const GButton(icon: Icons.history,),
                   GButton(icon: Icons.settings,onPressed: () => scontroller.getUserProfileData(),),
                ]),
          )
        ),
      ),
    );
  }
}
