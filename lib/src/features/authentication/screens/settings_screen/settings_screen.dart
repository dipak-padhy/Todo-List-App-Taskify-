




import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/src/features/authentication/controller/bottom_navigation_controller.dart';
import 'package:todo_list/src/features/authentication/controller/setting_controller.dart';
import 'package:todo_list/src/repository/authentication_repository/authentication_repository.dart';
import '../../../../constants/colors.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SettingsScreen(),
    );
  }
}

BottomNavigationController bnController = Get.put(BottomNavigationController());
Settingcontroller settingcontroller = Get.put(Settingcontroller());

class SettingsScreen extends StatelessWidget {
   SettingsScreen({super.key});

final user = FirebaseAuth.instance.currentUser;





  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
appBar: AppBar(
  backgroundColor: todoPrimaryColor2,
  elevation: 0,
  actions: [
    IconButton(onPressed: (){}, icon: const Icon(Icons.light_mode_outlined))
  ],
  leading: const Icon(Icons.arrow_back_ios_rounded),
  title: const Center(
    child: Text("Profile", style: TextStyle(
      fontSize: 20,
      fontFamily: 'Satoshi',
      fontWeight: FontWeight.bold,
    ),),
  ),
),

     /*   floatingActionButton: FloatingActionButton(
          onPressed: () {
            AuthenticationRepository.instance.logout();
          },
          child: const Icon(
            Icons.logout_sharp,
          ),
        ),*/
        body: Column(
        //  mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
const SizedBox(
  height: 60,
),
            const Center(
              child: CircleAvatar(
                radius: 60,
                backgroundColor: todoSecondaryColor,
                backgroundImage: AssetImage('assets/images/walter-white.png'), // Replace with your user's profile image
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(
                left: 24.0,
                top: 8.0,
              ),
              child: Text(
                "Name",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontFamily: 'Satoshi',
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                  color: todoSecondaryColor,
                ),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: todoSecondaryColor6,
                  borderRadius: BorderRadius.circular(12),
                ),
                child:  Obx(
                  () => TextFormField(
                    // controller: addcontroller.remindMeController,
                    readOnly: true,
                    style: const TextStyle(
                        fontFamily: 'Satoshi',
                        fontWeight: FontWeight.w200,
                        fontSize: 16,
                        color: todoSecondaryColor),
                    decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      hintText:settingcontroller.userProfileData['username'],
                      hintStyle: const TextStyle(
                          fontFamily: 'Satoshi',
                          fontWeight: FontWeight.w200,
                          fontSize: 16,
                          color: todoSecondaryColor),
                      contentPadding: const EdgeInsets.fromLTRB(
                          24, 4, 12, 12),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 24.0,
                top: 8.0,
              ),
              child: Text(
                "Email",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontFamily: 'Satoshi',
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                  color: todoSecondaryColor,
                ),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: todoSecondaryColor6,
                  borderRadius: BorderRadius.circular(12),
                ),
                child:  Obx(
                  ()=> TextFormField(
                    // controller: addcontroller.remindMeController,
                    readOnly: true,
                    style: const TextStyle(
                        fontFamily: 'Satoshi',
                        fontWeight: FontWeight.w200,
                        fontSize: 16,
                        color: todoSecondaryColor),
                    decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      hintText:settingcontroller.userProfileData['email'],
                      hintStyle: const TextStyle(
                          fontFamily: 'Satoshi',
                          fontWeight: FontWeight.w200,
                          fontSize: 16,
                          color: todoSecondaryColor),
                      contentPadding: const EdgeInsets.fromLTRB(
                          24, 4, 12, 12),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 8.0),
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
                                  Icons.logout_rounded,

                                ),
                  onPressed: () {

                      AuthenticationRepository.instance.logout();

                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(4),
                    fixedSize: Size(344.sp, 44.sp),
                    backgroundColor: todoPrimaryColor,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  label:Text(
                  "Log Out",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: 'Satoshi',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                ),
              ),
            )


          ],
        ),
      ),
    );
  }
}

class Task {
  final String title;
  final String subtitle;
  final String date;

  Task({required this.title, required this.subtitle, required this.date});
}

List<String> categories = [
  'Personal',
  'Home',
  'Work',
  'Design',
  'New Ideas',
  'Personal',
  'Home',
  'Work',
  'Design',
  'New Ideas'
];

List<Task> tasks = [
  Task(title: 'Task 1', subtitle: 'Subtitle 1', date: 'Date 1'),
  Task(title: 'Task 2', subtitle: 'Subtitle 2', date: 'Date 2'),
  Task(title: 'Task 3', subtitle: 'Subtitle 3', date: 'Date 3'),
  Task(title: 'Task 1', subtitle: 'Subtitle 1', date: 'Date 1'),
  Task(title: 'Task 2', subtitle: 'Subtitle 2', date: 'Date 2'),
  Task(title: 'Task 3', subtitle: 'Subtitle 3', date: 'Date 3'),
  Task(title: 'Task 1', subtitle: 'Subtitle 1', date: 'Date 1'),
  Task(title: 'Task 2', subtitle: 'Subtitle 2', date: 'Date 2'),
  Task(title: 'Task 3', subtitle: 'Subtitle 3', date: 'Date 3'),

  // Add more tasks as needed
];
















