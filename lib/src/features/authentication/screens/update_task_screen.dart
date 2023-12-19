


import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_list/src/constants/colors.dart';
import 'package:todo_list/src/features/authentication/controller/add_task_controller.dart';
import 'package:todo_list/src/features/authentication/controller/update_task_controller.dart';

import 'home_screen/home_screen.dart';


final _formkey4 = GlobalKey<FormState>();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: UpdateTaskScreen(document: {}, id: '',),
    );
  }
}

class UpdateTaskScreen extends StatefulWidget {
  const UpdateTaskScreen({super.key,required this.document,required this.id});
  final Map<String,dynamic> document;
  final String id;


  @override
  State<UpdateTaskScreen> createState() => _UpdateTaskScreenState();
}

class _UpdateTaskScreenState extends State<UpdateTaskScreen> {
  late TextEditingController titlecontroller;
  late TextEditingController desccontroller;
 late String category;
  late String date;
  late String st;
  late String et;
  late String reminder;
  final UpdateTaskController upcontroller = Get.put(UpdateTaskController());
  late final String showid;


  @override
  void initState() {
    super.initState();

    var user = FirebaseAuth.instance.currentUser;

    titlecontroller = TextEditingController(text:widget.document['Title']);
    desccontroller = TextEditingController(text:widget.document['Description']);
    category =widget.document['Category'];
    upcontroller.getValue(category);
    date =widget.document['Date'];
    upcontroller.getDate(date);
    st =widget.document['StartTime'];
    upcontroller.getst(st);
   et =widget.document['EndTime'];
   upcontroller.getet(et);
   reminder=widget.document['Reminder'];
   upcontroller.getremind(reminder);
   showid=widget.id;


   log(date);


  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 68.sp),
                Form(
                  key: _formkey4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(
                          left: 24.0,
                          top: 8.0,
                        ),
                        child: Text(
                          "Title",
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
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            controller: titlecontroller,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter Title Name";
                              } else {
                                return null;
                              }
                            },
                            maxLines: 1,
                            decoration: const InputDecoration(
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              hintText: "Add Task Name",
                              contentPadding:
                              EdgeInsets.fromLTRB(24, 4, 12, 12),
                            ),
                            style: const TextStyle(
                                fontFamily: 'Satoshi',
                                fontWeight: FontWeight.w200,
                                fontSize: 16,
                                color: todoSecondaryColor),
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
                          "Description",
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
                          child: TextFormField(
                            keyboardType: TextInputType.multiline,
                            controller: desccontroller,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter Task Description";
                              } else {
                                return null;
                              }
                            },
                            maxLines: 5,
                            decoration: const InputDecoration(
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              hintText: "Add Task Description",
                              contentPadding:
                              EdgeInsets.fromLTRB(24, 4, 12, 12),
                            ),
                            style: const TextStyle(
                                fontFamily: 'Satoshi',
                                fontWeight: FontWeight.w200,
                                fontSize: 16,
                                color: todoSecondaryColor),
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
                          "Category",
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
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: todoSecondaryColor6,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(children: [
                            Expanded(
                              child: Obx(
                                    () => TextFormField(
                                    //  initialValue: upcontroller.selectedValue.toString(),
                                  controller: upcontroller.categoryController,
                                 onChanged: (value) {
                                      upcontroller.categoryController.text = value;
                                  },
                                  readOnly: true,
                                  style: const TextStyle(
                                      fontFamily: 'Satoshi',
                                      fontWeight: FontWeight.w200,
                                      fontSize: 20,
                                      color: todoSecondaryColor),
                                  decoration: InputDecoration(
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    hintText:
                                   upcontroller.selectedValue.toString(),
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
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 12, 4),
                              child: DropdownButton(
                                underline: Container(
                                  height: 0,
                                ),
                              //  value: upcontroller.selectedValue.toString(),
                                items: categories.map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value.toString(),
                                        child: Text(value.toString()),
                                      );
                                    }).toList(),
                                onChanged: (value) {
                                  upcontroller.getValue(value!);

                                },
                              ),
                            ),
                          ]),
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
                          "Date",
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
                          child: Row(children: [
                            Expanded(
                              child: Obx(
                                    () => TextFormField(
                                  controller: upcontroller.dateController,
                                 /* onChanged:  (value) {
                      upcontroller.dateController.text = value;
                      },*/

                                  onTap: () => upcontroller.showDatePickers(
                                      context: context,
                                      initialDate: date,
                                      firstDate: DateTime(2022),
                                      lastDate: DateTime(2099)),
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
                                    hintText: upcontroller.selectedDate.value,
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
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 12, 4),
                              child: SizedBox(
                                //color: Colors.orange,
                                width: 24.sp,
                                child: IconButton(
                                    padding: const EdgeInsets.only(right: 28.0),
                                    onPressed: () =>
                                        upcontroller.showDatePickers(
                                            context: context,
                                            initialDate: date,
                                            firstDate: DateTime(2022),
                                            lastDate: DateTime(2099)),
                                    icon: const Padding(
                                      padding: EdgeInsets.only(right: 28.0),
                                      child: Icon(
                                        Icons.calendar_today_rounded,
                                        color: Colors.grey,
                                      ),
                                    )),
                              ),
                            )
                          ]),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 24.0, right: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Start Time",
                              //  textAlign: TextAlign.ce,
                              style: TextStyle(
                                fontFamily: 'Satoshi',
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                                color: todoSecondaryColor,
                              ),
                            ),
                            SizedBox(
                              width: 144.sp,
                              //  color: Colors.purple,
                              child: const Text(
                                "End Time",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontFamily: 'Satoshi',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20,
                                  color: todoSecondaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: todoSecondaryColor6,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Row(children: [
                                        Expanded(
                                          child: Obx(
                                                () => TextFormField(
                                             /* controller: upcontroller
                                                  .startTimeController,*/
                                              onTap: () =>
                                                  upcontroller.getTimeFromUser(
                                                      context: context,
                                                      initialtime: st,
                                                      isStartTime: true),
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
                                                hintText: upcontroller.startTime.value,
                                                hintStyle: const TextStyle(
                                                    fontFamily: 'Satoshi',
                                                    fontWeight: FontWeight.w200,
                                                    fontSize: 16,
                                                    color: todoSecondaryColor),
                                                contentPadding:
                                                const EdgeInsets.fromLTRB(
                                                    24, 4, 12, 12),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          //color: Colors.orange,
                                          width: 24.sp,
                                          child: IconButton(
                                              padding: const EdgeInsets.only(
                                                  right: 28.0),
                                              onPressed: () =>
                                                  upcontroller.getTimeFromUser(
                                                      context: context,
                                                      initialtime: st,
                                                      isStartTime: true),
                                              icon: const Padding(
                                                padding: EdgeInsets.only(
                                                  right: 28.0,
                                                  bottom: 8,
                                                ),
                                                child: Icon(
                                                  Icons.access_time_rounded,
                                                  color: Colors.grey,
                                                ),
                                              )),
                                        ),
                                      ]),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  /*  const Text(
                                    "End Time",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontFamily: 'Satoshi',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20,
                                      color: todoSecondaryColor,
                                    ),
                                  ),*/
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0, right: 20.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: todoSecondaryColor6,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Obx(
                                                    () => TextFormField(
                                                /*  controller: acontroller
                                                      .endTimeController,*/
                                                  onTap: () => upcontroller
                                                      .getTimeFromUser(
                                                      context: context,
                                                      initialtime: et,
                                                      isStartTime: false),
                                                  readOnly: true,
                                                  style: const TextStyle(
                                                      fontFamily: 'Satoshi',
                                                      fontWeight:
                                                      FontWeight.w200,
                                                      fontSize: 16,
                                                      color:
                                                      todoSecondaryColor),
                                                  decoration: InputDecoration(
                                                    enabledBorder:
                                                    InputBorder.none,
                                                    focusedBorder:
                                                    InputBorder.none,
                                                    errorBorder:
                                                    InputBorder.none,
                                                    hintText:upcontroller.endTime.value,
                                                    hintStyle: const TextStyle(
                                                        fontFamily: 'Satoshi',
                                                        fontWeight:
                                                        FontWeight.w200,
                                                        fontSize: 16,
                                                        color:
                                                        todoSecondaryColor),
                                                    contentPadding:
                                                    const EdgeInsets
                                                        .fromLTRB(
                                                        24, 4, 12, 12),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              //color: Colors.orange,
                                              width: 24.sp,
                                              child: IconButton(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      right: 28.0),
                                                  onPressed: () => upcontroller
                                                      .getTimeFromUser(
                                                      context: context,
                                                      initialtime: et,
                                                      isStartTime: false),
                                                  icon: const Padding(
                                                    padding: EdgeInsets.only(
                                                      right: 28.0,
                                                      bottom: 8,
                                                    ),
                                                    child: Icon(
                                                      Icons.access_time_rounded,
                                                      color: Colors.grey,
                                                    ),
                                                  )),
                                            ),
                                          ]),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                      const SizedBox(
                        height: 8,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                          left: 24.0,
                          top: 8.0,
                        ),
                        child: Text(
                          "Remind Me",
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
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: todoSecondaryColor6,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(children: [
                            Expanded(
                              child: Obx(
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
                                    hintText:
                                    "${upcontroller.selectedRemind.value} minutes early",
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
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 12, 4),
                              child: DropdownButton(
                                underline: Container(
                                  height: 0,
                                ),
                                items: remindList
                                    .map<DropdownMenuItem<String>>((int value) {
                                  return DropdownMenuItem<String>(
                                    value: value.toString(),
                                    child: Text(value.toString()),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  upcontroller.changeRemind(value!);
                                },
                              ),
                            )
                          ]),
                        ),
                      ),
                      const SizedBox(
                        height: 28,
                      ),
                      Row(

                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0, right: 20.0, bottom: 8),
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
                                    Icons.cancel_outlined,
                                  ),
                                  onPressed: () {
                                    Get.back();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.all(4),
                                    fixedSize: Size(344.sp, 44.sp),
                                    backgroundColor: Colors.red,
                                    foregroundColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                  ),
                                  label: Text(
                                    "Cancel",
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontFamily: 'Satoshi',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0, right: 20.0, bottom: 8),
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
                                    Icons.change_circle_outlined,
                                  ),
                                  onPressed: () {
                                    if (_formkey4.currentState!.validate()) {
                                      //log("sucesssssssssssss!!!!!!!!!!!!!!!!!!!");
                                      log("------------------------------------------------------------>${widget.id}");
                                      upcontroller.getRegisteredTaskUpdate(
                                          id:widget.id,
                                          title: titlecontroller.text.trim(),
                                          desc: desccontroller.text
                                              .trim(),
                                          category:
                                          upcontroller.selectedValue.trim(),
                                          date: upcontroller.selectedDate.trim(),
                                          st: upcontroller.startTime.trim(),
                                          et: upcontroller.endTime.trim(),
                                          reminder:
                                          upcontroller.selectedRemind.trim());
                                      clearField();
                                     // Get.back();
                                      Navigator.of(context).pop();
                                     // Get.back();

                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.all(4),
                                    fixedSize: Size(344.sp, 44.sp),
                                    backgroundColor: todoPrimaryColor,
                                    foregroundColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                  ),
                                  label: Text(
                                    "Update Task",
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontFamily: 'Satoshi',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                        ],
                      )
                   
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: todoPrimaryColor2,
            height: 74,
            child:  Column(
              children: [
                Row(

                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 0),
                      child: IconButton(icon:const Icon(Icons.arrow_back_ios_rounded),onPressed: () => Navigator.of(context).pop(),),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(64, 8, 8, 0),
                      child: Text(
                        "Update Task",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Satoshi',
                          fontWeight: FontWeight.w400,
                          fontSize: 28,
                          color: todoPrimaryColor,
                        ),
                      ),
                    ),

                  ],
                ),
                const Divider(
                  color: todoSecondaryColor2,
                  thickness: 0.5,
                ),
              ],
            ),

          )
        ]),
      ),
    );
  }

  void clearField() {
    titlecontroller.clear();
   desccontroller.clear();
  }
}
