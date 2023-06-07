import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class Home extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          appBar: AppBar(
            title: const Text('Route'),
          ),
          body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('This is Home Screen',
                    style: TextStyle(fontSize: 24, color: Colors.red),),
                  const SizedBox(height: 10),
                  ElevatedButton(
                      onPressed: () {}, child: const Text('Next screen')),
                  const SizedBox(height: 10),
                  ElevatedButton(onPressed: () => Get.back(),
                      child: const Text('Back to main screen')),
                  Text('${Get.arguments}',style: TextStyle(fontSize:24,color:Colors.black),),


                ],
              )),
        );
  }
}
