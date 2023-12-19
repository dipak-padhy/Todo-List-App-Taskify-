import 'dart:developer';

import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../repository/authentication_repository/authentication_repository.dart';

class AddTaskController extends GetxController {
  static AddTaskController get instance => Get.find();

  RxString selectedValue = "Personal".obs;
  RxString selectedRemind = "5".obs;
  RxString endTime = "9:30 PM".obs;
  RxString startTime =
      DateFormat('hh:mm a').format(DateTime.now()).toString().obs;
  RxString selectedDate =
      DateFormat('yyyy-MM-dd').format(DateTime.now()).toString().obs;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();
  final TextEditingController remindMeController = TextEditingController();


  void changeValue(String value) {
    selectedValue.value = value;
  }

  void changeRemind(String value){
    selectedRemind.value=value;
  }

  getTimeFromUser({required context,required bool isStartTime}) async {
   // var initialtime2 =
    var pickedTime = await showTimePickers(context: context, );
    String formattedTime = pickedTime!.format(context);

    if (pickedTime == null) {
      log("choose the time");
    } else if (isStartTime == true) {
      startTime.value = formattedTime;
    } else if (isStartTime == false) {
      endTime.value = formattedTime;
    }
  }

  showTimePickers({required context}) {
    return showTimePicker(
        context: context,
        initialTime: TimeOfDay(
        hour: int.parse(startTime.split(":")[0]),
    minute: int.parse(startTime.split(":")[1].split(" ")[0])),
        initialEntryMode: TimePickerEntryMode.input);
  }

  showDatePickers(
      {required context,
      required DateTime initialDate,
      required DateTime firstDate,
      required DateTime lastDate}) async {
    DateTime? pickerDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2022),
        lastDate: DateTime(2099));

    if (pickerDate != null) {
      var newDate = returnValue(pickerDate);
      selectedDate.value = newDate.toString();
      //  await getPickedDate();
    } else {
      log("choose the date");
    }
  }

  returnValue(value) {
    RxString conversionDate =
        DateFormat('yyyy-MM-dd').format(value).toString().obs;
    return conversionDate;
  }

void getTaskRegistered({required title,required desc,required category,required date,required st,required et,required reminder}){
    AuthenticationRepository.instance.addTaskToDb(title, desc, category, date, st, et, reminder);
    log(titleController.toString());
}
}
