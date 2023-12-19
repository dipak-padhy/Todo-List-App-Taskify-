import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_list/src/constants/text_strings.dart';
import 'package:todo_list/src/features/authentication/screens/sign_up/widgets/signup_footer_widget.dart';
import 'package:todo_list/src/features/authentication/screens/sign_up/widgets/singup_form_widget.dart';
import '../../../../common_widgets/form/form_header_widget.dart';

class TodoSignUp extends StatefulWidget {
  const TodoSignUp({super.key});

  @override
  State<TodoSignUp> createState() => _TodoSignUpState();
}

class _TodoSignUpState extends State<TodoSignUp> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Container(
          padding:const EdgeInsets.symmetric(vertical: 4.0,horizontal: 12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FormHeaderWidget(
                  title: todoSignUpTitle,
                  subtitle: todoSignUpSubtitle,
                ),
                SizedBox(
                  height: 28.sp,
                ),
                SignUpFormWidget(),
                const SizedBox(height: 8,),
                const SignUpFooterWidget(),
              ],
            ),
          //),
        ),
      )),
    );
  }
}


