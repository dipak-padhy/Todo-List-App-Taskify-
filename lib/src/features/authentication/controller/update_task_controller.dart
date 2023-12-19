import 'dart:developer';

import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/src/repository/authentication_repository/authentication_repository.dart';

class UpdateTaskController extends GetxController {
  static UpdateTaskController get instance => Get.find();


  final TextEditingController categoryController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();
  final TextEditingController remindMeController = TextEditingController();

  RxString selectedValue = "".obs;
  RxString selectedRemind = "".obs;
  RxString endTime = "".obs;
  RxString startTime =

          "".obs;
  RxString selectedDate =

         "" .obs;


  void getValue(String value) {
    selectedValue.value = value;
  }

  void getDate ( String value){
    selectedDate.value = value;
  }
void getst(String value){
    startTime.value=value;
}
  void getremind(String value){
    selectedRemind.value=value;
  }
void getet(String value){
    endTime.value=value;
}
  void changeValue(String newValue) {
    selectedValue.value = newValue;
  }

  void changeRemind(String value) {
    selectedRemind.value = value;
  }

  getTimeFromUser({required context,required initialtime, required bool isStartTime}) async {
    var pickedTime = await showTimePickers(context: context,);
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


  showDatePickers({required context,
    required String initialDate,
    required DateTime firstDate,
    required DateTime lastDate}) async {

    var initialdatetime =DateTime.parse(initialDate);
    DateTime? pickerDate = await showDatePicker(
        context: context,
        initialDate: initialdatetime,
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
        DateFormat('yyyy-MM-dd')
            .format(value)
            .toString()
            .obs;
    return conversionDate;
  }

  void getRegisteredTaskUpdate({required id, required title,required desc,required category,required date,required st,required et,required reminder}){
    AuthenticationRepository.instance.updateTask(id,title, desc, category, date, st, et, reminder);
    //log(titleController.toString());
  }


  }
