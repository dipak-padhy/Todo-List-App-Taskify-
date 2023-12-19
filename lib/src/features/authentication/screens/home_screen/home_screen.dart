import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_list/src/features/authentication/controller/home_screen_controller.dart';
import 'package:todo_list/src/features/authentication/controller/setting_controller.dart';
import 'package:todo_list/src/features/authentication/screens/update_task_screen.dart';
import 'package:todo_list/src/repository/authentication_repository/authentication_repository.dart';
import '../../../../constants/colors.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      home: HomeScreen(),
    );
  }
}

final hsControlller = Get.put(homeScreenController());
Settingcontroller scontroller = Get.put(Settingcontroller());
/*final taskID = hsControlller.loginUserData[index]*/
final listTask = hsControlller.loginUserData;
final user = FirebaseAuth.instance.currentUser;

final homeScreenController hscontroller = Get.put(homeScreenController());

//final usersList = FirebaseFirestore.instance.collection("Users").doc(user!.uid);

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {



@override
void initState(){
  super.initState();
  scontroller.getUserProfileData();
}


  final taskList = FirebaseFirestore.instance
      .collection("Tasks")
      .where("uid", isEqualTo: user!.uid)
      .snapshots();

  //var _formkey3;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      hsControlller.getLoginUserProduct();
    });
    return SafeArea(
      child: Scaffold(
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
        Padding(
        padding:
        const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(
            () => Text(
                    'Hello,${scontroller.userProfileData['username']}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontFamily: 'Satoshi',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const CircleAvatar(
                  radius: 20,
                  backgroundColor: todoSecondaryColor,
                  backgroundImage: AssetImage(
                      'assets/images/walter-white.png'), // Replace with actual image
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              height: 124,
              width: 500,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.black,
                  image: const DecorationImage(
                      opacity: .25,
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7WLdHQKCXhLsyimPVhJ4SjowRP1HRWeUr-w&usqp=CAU'))),
              child: const Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 12, horizontal: 12),
                      child: Text(
                        "Sometimes, things may not go your way, but the effort should be there every single night.",
                        softWrap: true,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Satoshi',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ]),
            ),
            const SizedBox(
              height: 32,
            ),
          /* const TextField(
              decoration: InputDecoration(
                hintText: 'Search for tasks...',
                hintStyle: TextStyle(
                    fontFamily: 'Satoshi', fontWeight: FontWeight.w100),
                prefixIcon: Icon(Icons.search),
              ),
            ),*/
           /* const SizedBox(
              height: 12,
            ),*/
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categories.map((category) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Chip(
                        label: Text(
                          category,
                          style: const TextStyle(
                              fontFamily: 'Satoshi',
                              color: todoSecondaryColor5),
                        ),
                        backgroundColor: todoPrimaryColor),
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
      StreamBuilder<QuerySnapshot>(
        stream: taskList,
        builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Column(
              children: [
                SizedBox(height: 180.sp,),
                const Center(child: CircularProgressIndicator()),
              ],
            );
          }
          if(snapshot.hasError){
            return const Text("some error occurred");
          }
          if(snapshot.data!.docs.isEmpty){
            return Container(
              height: 460,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //SizedBox(height: 60.sp,),
                  Image.asset("assets/images/sticky-note.png",height: 60,),
                  const Center(child: const Text("Add a Task,Gain Productivity",style:  TextStyle(
                      fontFamily: 'Satoshi',
                      fontWeight: FontWeight.w500,
                      fontSize: 16),)),
                ],
              ),
            );
          }
else{
            log("${snapshot.data!.docs.length}");
            return Expanded(
              child: ListView.builder(
                //shrinkWrap: true,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> document = snapshot.data!.docs[index]
                      .data() as Map<String, dynamic>;
                  var id = snapshot.data!.docs[index].id;
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: GestureDetector(
                      onTap: () => _showTaskPopupMenu(context, document, id),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black,
                                  //spreadRadius: 2,
                                  offset: Offset(1.0, 1.8)),
                            ]),
                        child: Card(
                          color: todoPrimaryColor2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          //  borderOnForeground: false,
                          // elevation: 20.0,
                          shadowColor: todoSecondaryColor6,
                          child: ListTile(
                            title: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  8.0, 24, 0, 4),
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.circle_rounded,
                                        size: 20,
                                      ),
                                      const SizedBox(width: 8.0),
                                      Text(
                                        /*hsControlller.loginUserData[index].taskCategory,*/
                                          snapshot.data!
                                              .docs[index]['Category']
                                              .toString(),
                                          style: const TextStyle(
                                              fontFamily: 'Satoshi',
                                              fontSize: 12)),
                                    ],
                                  ),
                                  Text(
                                    snapshot
                                        .data!.docs[index]['Title']
                                        .toString(),
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                        fontFamily: 'Satoshi',
                                        fontSize: 24),
                                  ),
                                ],
                              ),
                            ),
                            subtitle: Column(
                              children: [
                                const Divider(
                                  color: Colors.black,
                                  thickness: 2.5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      8.0, 20, 8, 16),
                                  child: Row(children: [
                                    const Icon(
                                      Icons.calendar_today_rounded,
                                      size: 22,
                                    ),
                                    const SizedBox(width: 8.0),
                                    Text(
                                        snapshot
                                            .data!.docs[index]['Date']
                                            .toString(),
                                        style: const TextStyle(
                                          fontFamily: 'Satoshi',
                                        )),
                                  ]),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      8.0, 8, 8, 16),
                                  child: Row(children: [
                                    const Icon(
                                      Icons.alarm_on_rounded,
                                      size: 22,
                                    ),
                                    const SizedBox(width: 8.0),
                                    Text(
                                        snapshot.data!
                                            .docs[index]['StartTime']
                                            .toString(),
                                        style: const TextStyle(
                                          fontFamily: 'Satoshi',
                                        )),
                                  ]),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      8.0, 8, 8, 24),
                                  child: Row(children: [
                                    const Icon(
                                      Icons
                                          .add_circle_outline_rounded,
                                      size: 24,
                                    ),
                                    const SizedBox(width: 8.0),
                                    SizedBox(
                                      //  color: Colors.orange,
                                      width: 292,
                                      child: Text(
                                          snapshot
                                              .data!
                                              .docs[index]
                                          ['Description']
                                              .toString(),
                                          style: const TextStyle(
                                            fontFamily: 'Satoshi',
                                            overflow:
                                            TextOverflow.clip,
                                          )),
                                    ),
                                  ]),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                  );
                },
              ),
            );
          }

      },),

      ],
    ),)
    ,
    );
  }

  void _showTaskPopupMenu(BuildContext context,document,id) {
    log(id);
    Get.bottomSheet(

        Container(
          decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(28.0),
              topRight: Radius.circular(28.0),
            ),
          ),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(28.0),
                topRight: Radius.circular(28.0),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 16,),
                ListTile(
                  leading: const Icon(Icons.edit),
                  title: const Text('Edit Task'),
                  onTap: () {
                    // Handle edit task action

                    Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateTaskScreen(
                        document: document,id:id),));

                   /* Get.back();*/
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.delete, color: Colors.red,),
                  title: const Text(
                    'Delete Task', style: TextStyle(color: Colors.red),),
                  onTap: () {
                    // Handle delete task action
                  showCupertinoDialog(
                      context: context,
                      builder: (context) => CupertinoAlertDialog(
                        title: const Text("Alert",/*textAlign:TextAlign.start*/style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Satoshi',
                        ),),
                        content: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Are You Sure You Want To Delete This Task ?",style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Satoshi',
                          ),),
                        ),
                        actions: [
                          CupertinoDialogAction(

                              child: const Text("No",style: TextStyle(
                                  color: todoPrimaryColor
                              ),),
                            onPressed: () {
                              Get.back();
                              Get.back();
                            }

                          ),
                          CupertinoDialogAction(
                              isDestructiveAction:true,
                            child: const Text("Yes",style: TextStyle(

                            ),),
                            onPressed: () {
                              AuthenticationRepository.instance.deleteTask(id);
                              Get.back();
                              Get.back();

                            }

                          )
                        ],

                      ),);
                  },
                ),
                const SizedBox(
                  height: 16,
                )
              ],
            ),
          ),
        )

    );
  }

}

/*
showDatePicker () async{

  DateTime? _picker = await showDatePicker(context:context,initialDate: DateTime.now(), firstDate: DateTime(2022), lastDate: DateTime(2099));
}
*/

class Task {
  final String title;
  final String subtitle;
  final String date;

  Task({required this.title, required this.subtitle, required this.date});
}

List<int> remindList = [
  5,
  10,
  15,
  20,
];
List<String> categories = [
  'Personal',
  'Home',
  'Work',
  'Design',
  'New Ideas',
];

/*List<Task> tasks = [
  Task(title: 'Task 1', subtitle: 'Subtitle 1', date: 'Date 1'),
  Task(title: 'Task 2', subtitle: 'Subtitle 2', date: 'Date 2'),
  Task(title: 'Task 3', subtitle: 'Subtitle 3', date: 'Date 3'),
  Task(title: 'Task 1', subtitle: 'Subtitle 1', date: 'Date 1'),
  Task(title: 'Task 2', subtitle: 'Subtitle 2', date: 'Date 2'),
  Task(title: 'Task 3', subtitle: 'Subtitle 3', date: 'Date 3'),
  Task(title: 'Task 1', subtitle: 'Subtitle 1', date: 'Date 1'),
  Task(title: 'Task 2', subtitle: 'Subtitle 2', date: 'Date 2'),
  Task(title: 'Task 3', subtitle: 'Subtitle 3', date: 'Date 3'),
];*/
