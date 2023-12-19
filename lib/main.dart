import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_list/firebase_options.dart';
import 'package:todo_list/src/features/authentication/screens/login/login_screen.dart';
import 'package:todo_list/src/features/authentication/screens/on_boarding/on_boarding_screen.dart';
import 'package:todo_list/src/features/authentication/screens/sign_up/sign_up_screen.dart';
import 'package:todo_list/src/repository/authentication_repository/authentication_repository.dart';
import 'package:todo_list/src/utils/theme.dart';

void main() async{
 /*  runApp(DevicePreview(
    enabled: true,
     builder: (context) => const MyApp()));*/
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    Get.put(AuthenticationRepository());
    runApp(const MyApp());
  } catch (error) {
    // Handle initialization error, e.g., show an error message or exit the app gracefully.
    print("Firebase initialization error: $error");
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) =>
          GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: TodoAppTheme.lightTheme,
            darkTheme: TodoAppTheme.darkTheme,
            themeMode: ThemeMode.system,
            useInheritedMediaQuery: true,
             /*  locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,*/
            title: 'Demo',
            home:const Scaffold(body: Center(child: CircularProgressIndicator(strokeWidth: 1,))),
          ),
      designSize: const Size(365, 798),
    );
  }

/*return Sizer(builder: (context,orientation,deviceType),
      return GetMaterialApp(
       title: 'Demo',
        home: Home(),
      ),
    );*/
}