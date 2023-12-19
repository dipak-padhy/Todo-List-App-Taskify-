
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_list/src/features/authentication/controller/add_task_controller.dart';

import '../../../../constants/colors.dart';

import '../home_screen/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AddTaskScreen(),
    );
  }
}

final _formkey2 = GlobalKey<FormState>();
final addcontroller = Get.put(AddTaskController());

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

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
                  key: _formkey2,
                  //autovalidateMode: AutovalidateMode.onUserInteraction,
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
                            controller: addcontroller.titleController,
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
                            controller: addcontroller.descriptionController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter Task Description";
                              } else {
                                return null;
                              }
                            },
                            maxLines: 3,
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
                                  controller: addcontroller.categoryController,
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
                                        addcontroller.selectedValue.toString(),
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
                                items: categories.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value.toString(),
                                    child: Text(value.toString()),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  addcontroller.changeValue(value!);
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
                                  controller: addcontroller.dateController,
                                  onTap: () => addcontroller.showDatePickers(
                                      context: context,
                                      initialDate: DateTime.now(),
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
                                    hintText:
                                        addcontroller.selectedDate.toString(),
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
                                        addcontroller.showDatePickers(
                                            context: context,
                                            initialDate: DateTime.now(),
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
                                              controller: addcontroller
                                                  .startTimeController,
                                              onTap: () =>
                                                  addcontroller.getTimeFromUser(
                                                      context: context,
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
                                                hintText: addcontroller
                                                    .startTime
                                                    .toString(),
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
                                                  addcontroller.getTimeFromUser(
                                                      context: context,
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
                                                  controller: addcontroller
                                                      .endTimeController,
                                                  onTap: () => addcontroller
                                                      .getTimeFromUser(
                                                          context: context,
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
                                                    hintText: addcontroller
                                                        .endTime
                                                        .toString(),
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
                                                  onPressed: () => addcontroller
                                                      .getTimeFromUser(
                                                          context: context,
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
                                  controller: addcontroller.remindMeController,
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
                                        "${addcontroller.selectedRemind.toString()} minutes early",
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
                                  addcontroller.changeRemind(value!);
                                },
                              ),
                            )
                          ]),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Padding(
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
                              Icons.add_task_rounded,
                            ),
                            onPressed: () {
                              if (_formkey2.currentState!.validate()) {
                                //log("sucesssssssssssss!!!!!!!!!!!!!!!!!!!");

                                addcontroller.getTaskRegistered(
                                    title: addcontroller.titleController.text
                                        .trim(),
                                    desc: addcontroller
                                        .descriptionController.text
                                        .trim(),
                                    category:
                                        addcontroller.selectedValue.trim(),
                                    date: addcontroller.selectedDate.trim(),
                                    st: addcontroller.startTime.trim(),
                                    et: addcontroller.endTime.trim(),
                                    reminder:
                                        addcontroller.selectedRemind.trim());

                                clearField();

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
                              "Add New Task",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontFamily: 'Satoshi',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: todoPrimaryColor2,
            height: 74,
            child: const Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(12, 8, 8, 0),
                  child: Text(
                    "New Task",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Satoshi',
                      fontWeight: FontWeight.w400,
                      fontSize: 28,
                      color: todoPrimaryColor,
                    ),
                  ),
                ),
                Divider(
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
    addcontroller.titleController.clear();
    addcontroller.descriptionController.clear();
  }
}
