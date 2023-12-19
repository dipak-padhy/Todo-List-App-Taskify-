import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../constants/colors.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CalendarScreen(),
    );
  }
}

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // color: Colors.orange,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      height: 124,
                      width: 500,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.black,
                          image:  const DecorationImage(
                              opacity: .25,
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7WLdHQKCXhLsyimPVhJ4SjowRP1HRWeUr-w&usqp=CAU'))),
                      child: const Stack(alignment: Alignment.centerRight, children: [
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
                    const SizedBox(height: 32,),
                    const TextField(
                      decoration: InputDecoration(
                        hintText: 'Search for tasks...',
                        hintStyle: TextStyle(
                            fontFamily: 'Satoshi',
                            fontWeight: FontWeight.w100
                        ),
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                    const SizedBox(height: 12,),
                  /*  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: categories.map((category) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Chip(label: Text(category,style: const TextStyle( fontFamily: 'Satoshi',color: todoSecondaryColor5),),backgroundColor: todoPrimaryColor),
                          );
                        }).toList(),
                      ),
                    )*/
                  ],
                ),
              ),
            ),

            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 4.0,
                      child: ListTile(
                        title: Text(tasks[index].title,style: const TextStyle( fontFamily: 'Satoshi',) ,),
                        subtitle: Text(tasks[index].subtitle,style: const TextStyle( fontFamily: 'Satoshi',)),
                        trailing: Text(tasks[index].date,style: const TextStyle( fontFamily: 'Satoshi',)),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
          Center(child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 20,
              sigmaY: 20,
            ),
              child:  Center(
                child: GestureDetector(
                  onTap:  () => Get.snackbar(
                      "oops", "Currently this feature is under devlopment",
                      titleText: Text(
                        "Oops!",
                        style: TextStyle(
                          color: todoPrimaryColor,
                          fontSize: 12.sp,
                          fontFamily: 'Satoshi',
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                      isDismissible: true,
                      duration: const Duration(milliseconds: 1800),
                      messageText: Text(
                        "Currently the payment gateway is under service.",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: 'Satoshi',
                          // fontWeight: FontWeight.w400,
                        ),
                      ),
                      snackPosition: SnackPosition.TOP,
                      snackStyle: SnackStyle.FLOATING,
                      shouldIconPulse: true,
                      margin: const EdgeInsets.all(40)),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(child: Image(image: AssetImage("assets/images/padlock.png",),height: 160)),
                        SizedBox(
                          height: 40,
                        ),
                        Center(child: Text("Buy Premium",style: TextStyle(
                          fontSize: 28,
                          fontFamily: 'Satoshi',
                          color: Colors.white,
                        ),)),
                        Center(child: Text("To Sync Your Task With Calender",style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Satoshi',
                          color: Colors.white,
                        ),)),

                      ],
                    ),
                  ),
                ),
              )
          )
          ),
      ]
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

/*SafeArea(
child: Scaffold(
/*  appBar: AppBar(
          title: const Text('Your App'),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                // Handle search functionality here
              },
            ),
          ],
        ),*/
body: const MyTaskList(),
),
);
class MyTaskList extends StatefulWidget {

  const MyTaskList({super.key});

  @override
  State<MyTaskList> createState() => _MyTaskListState();
}

class _MyTaskListState extends State<MyTaskList> {
  List<String> categories = ['Personal', 'Home', 'Work', 'Design', 'New Ideas'];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          expandedHeight: 200.0,
          title: const Text('Hello,Username',style: TextStyle(fontSize: 24),),
          flexibleSpace: FlexibleSpaceBar(
          //  title: const Text('Username'),
            background: Container(
              color: Colors.blue,
              child: const Center(
                child: Column(
                  children: [
                    SizedBox(height: 104,),
                    Stack(
                      children:[ CircularProgressIndicator(
                        value: 0.75, // Replace with actual progress value
                      ),
                        Text("75%"),
                    ]
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 2),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search for tasks...',
                          prefixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for tasks...',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 100.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Chip(label: Text(categories[index])),
                );
              },
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
                (context, index) {
              return const Padding(
                padding: EdgeInsets.all(8.0),
                child: Card(
                  elevation: 4.0,
                  child: ListTile(
                    title: Text('Task Title'),
                    subtitle: Text('Task Subtitle'),
                    trailing: Text('Date'),
                  ),
                ),
              );
            },
            childCount: 20, // Replace with actual number of tasks
          ),
        ),
      ],
    );

  }
} */

/*SafeArea(
child: Scaffold(
floatingActionButton: FloatingActionButton(
onPressed: () {
AuthenticationRepository.instance.logout();
},
child: Icon(
Icons.logout_sharp,
),
),
body: Container(
height: 250.h,
width: double.infinity,
decoration: BoxDecoration(
borderRadius: const BorderRadius.only(
bottomRight: Radius.circular(40),
bottomLeft: Radius.circular(40),
),
color: Colors.grey[400],
),
child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
children: [
const SizedBox(height: 20),
SizedBox(
// color: Colors.blue,
height: 55,
child: Row(
mainAxisAlignment: MainAxisAlignment.start,
crossAxisAlignment: CrossAxisAlignment.center,
children: <Widget>[
const Padding(padding: EdgeInsets.only(left: 12)),
const CircleAvatar(
minRadius: 24,
maxRadius: 24.0,
backgroundImage: NetworkImage(
'https://letsenhance.io/static/66c1b6abf8f7cf44c19185254d7adb0c/28ebd/AiArtBefore.jpg'),
),
const SizedBox(
width: 16,
),
Column(
crossAxisAlignment: CrossAxisAlignment.start,
mainAxisAlignment: MainAxisAlignment.center,
children: [
Text(
"Hello,",
style: TextStyle(
color: Colors.black54,
fontSize: 16.sp,
),
),
Text(
"Christina",
style: TextStyle(
color: Colors.black,
fontSize: 20.sp,
),
)
],
),
],
),
),
SizedBox(
height: 12.h,
),
Padding(
padding:
EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 8.0.w),
child: Container(
height: 64.h,
//width: width*1,
width: 500.w,
decoration: BoxDecoration(
borderRadius: BorderRadius.circular(12),
color: Colors.black,
image: const DecorationImage(
opacity: .25,
fit: BoxFit.cover,
image: NetworkImage(
'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7WLdHQKCXhLsyimPVhJ4SjowRP1HRWeUr-w&usqp=CAU'))),
//color: Colors.blue,
child: Stack(alignment: Alignment.centerRight, children: [
Padding(
padding: EdgeInsets.symmetric(
vertical: 12.h, horizontal: 12.w),
child: Text(
"Sometimes, things may not go your way, but the effort should be there every single night.",
softWrap: true,
textAlign: TextAlign.center,
style: TextStyle(
fontSize: 12.sp,
color: Colors.white,
),
),
),
]),
),
),
SizedBox(
height: 16.h,
),
Padding(
padding: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 8.h),
child: Container(
width: 500,
decoration: BoxDecoration(
color: Colors.grey[200],
border: Border.all(color: Colors.white),
borderRadius: BorderRadius.circular(12),
),
child: TextField(
decoration: InputDecoration(
border: InputBorder.none,
hintText: 'Search A Task',
prefixIcon: const Icon(
Icons.search,
color: Colors.greenAccent,
),
suffixIcon: IconButton(
icon: const Icon(Icons.filter_list_sharp),
color: Colors.greenAccent,
onPressed: () {
// code for handling filters.
},
)),
),
),
),
],
),
),
),
);*/
