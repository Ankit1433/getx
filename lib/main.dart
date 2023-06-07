import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx1/home.dart';

import 'Student.dart';

void main() {
  runApp(MyHomePage());
}

class MyHomePage extends StatelessWidget {
  // var student = Student();
  var student = new Student(name: 'ankit', age:20).obs;
  var count = 0.obs;

  void increment() {
    count++;
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Snack bar',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('snack'),
          ),
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,

            children: [
              ElevatedButton(
                  onPressed: () {
                    Get.snackbar('Snackbar', 'hello Ankit ! How are you',
                        snackPosition: SnackPosition.BOTTOM,
                        // colorText: Colors.blue,
                        // titleText: Text('snackbar again',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
                        // messageText: Text('bye again'),
                        // backgroundColor: Colors.black,
                        borderRadius: 30,
                        margin: const EdgeInsets.all(10),
                        animationDuration: const Duration(milliseconds: 3000),
                        backgroundGradient: const LinearGradient(
                            colors: [Colors.red, Colors.green, Colors.blue]),
                        borderColor: Colors.black,
                        borderWidth: 1,
                        // duration: Duration(milliseconds:4000),
                        dismissDirection: DismissDirection.horizontal,
                        isDismissible: true,
                        icon: const Icon(Icons.play_arrow),
                        // shouldIconPulse: false,
                        // leftBarIndicatorColor: Colors.red,
                        mainButton: TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Retry',
                              style: TextStyle(color: Colors.black),
                            )),
                        onTap: (val) {
                          print('snackbar click');
                        },
                        overlayBlur: 3,
                        // showProgressIndicator: true,
                        reverseAnimationCurve: Curves.bounceInOut,
                        snackbarStatus: (val) {
                          print('snackbar status $val');
                        }
                        //   userInputForm: Form(child: Row(children: [
                        //     Expanded(child: TextField())
                        //   ],))
                        );
                  },
                  child: const Text('Show Snackbar')),
              ElevatedButton(
                  onPressed: () {
                    Get.defaultDialog(
                        title: "ANKIT",
                        titleStyle: const TextStyle(fontSize: 25),
                        middleText: 'Hello! How can I assist you today?',
                        middleTextStyle: const TextStyle(fontSize: 20),
                        backgroundColor: Colors.blue.shade100,
                        radius: 40,
                        content: const Row(children: [
                          CircularProgressIndicator(),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(child: Text('Data Loading')),
                        ]),
                        textCancel: 'Cancel',
                        cancelTextColor: Colors.black,
                        textConfirm: 'Confirm',
                        confirmTextColor: Colors.black,
                        onCancel: () {},
                        onConfirm: () {},
                        buttonColor: Colors.green,
                        cancel: const Text(
                          'cancels',
                          style: TextStyle(fontSize: 15),
                        ),
                        confirm: const Text(
                          'confirms',
                          style: TextStyle(fontSize: 15),
                        ),
                        actions: [
                          ElevatedButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: const Text('action-1')),
                          ElevatedButton(
                              onPressed: () {}, child: const Text('action-2')),
                        ],
                        barrierDismissible: false);
                  },
                  child: const Text('Show Dialogbox')),
              ElevatedButton(
                  onPressed: () {
                    Get.bottomSheet(
                        Container(
                          child: Wrap(
                            children: [
                              ListTile(
                                leading: const Icon(Icons.wb_sunny_outlined),
                                title: const Text('light theme'),
                                onTap: () =>
                                    {Get.changeTheme(ThemeData.light())},
                              ),
                              const Divider(),
                              ListTile(
                                leading: const Icon(Icons.wb_sunny),
                                title: const Text('dark theme'),
                                onTap: () =>
                                    {Get.changeTheme(ThemeData.dark())},
                              )
                            ],
                          ),
                        ),
                        // barrierColor: Colors.grey.shade100,
                        backgroundColor: Colors.pink.shade100,
                        isDismissible: true,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: const BorderSide(
                                color: Colors.black,
                                style: BorderStyle.solid,
                                width: 2.0)),
                        enableDrag: true);
                  },
                  child: const Text('show bottomsheet')),
              ElevatedButton(
                  onPressed: ()  {
                    Get.to(Home(),arguments: 'hy i am from main screen',
                    fullscreenDialog: true,
                      transition:Transition.zoom,
                      duration:Duration(milliseconds: 500));
                    // curve:Curves.bounceOut,
                    // Get.off(Home());
                    // Get.offAll(page),
                    // Get.to(Home(), arguments: 'Data from Main',
                    // var data = await Get.to(Home(),);
                    // print('the received data is: $data');
                  },
                  child: Text('Go to Home')),
              Obx(() => Text('Count value: $count',style: TextStyle(fontSize:24,color:Colors.red),),),
              ElevatedButton(onPressed: ()=>increment(), child: Text('Increment')),
              Obx(() => Text('Name is: ${student.value.name}',style: TextStyle(fontSize:24,color:Colors.red),),),
              ElevatedButton(onPressed: (){
                // student.name.value =student.name.value.toUpperCase();
                student.update((student){
                  student?.name=student.name.toString().toUpperCase();
                });
              }, child: Text('Upper'))


            ],
          )),
        ));
  }
}
