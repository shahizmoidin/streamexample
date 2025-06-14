import 'dart:async';

import 'package:flutter/material.dart';

class BroadcastStream extends StatelessWidget {
  
   BroadcastStream()
   {
super.key;
setBroadcast();
   }

   void setBroadcast() {
     Timer.periodic(Duration(seconds: 2), (timer){
       controller.add(timer.tick);
     });
   }


final StreamController<int> controller=StreamController.broadcast();
  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          StreamBuilder<int>(
            stream: controller.stream,
            builder: (context, asyncSnapshot) {
              if (asyncSnapshot.hasData) {
                return Text("listener one${asyncSnapshot.data}");
              } else {
          return     CircularProgressIndicator();
              }
              
            }
          ),
         
            StreamBuilder<int>(
            stream: controller.stream,
            builder: (context, asyncSnapshot) {
              if (asyncSnapshot.hasData) {
                return Text("listener two${asyncSnapshot.data}");
              } else {
          return     CircularProgressIndicator();
              }
              
            }
          ),
         
         
          Text("text 2")
        ],
      ),
    );
  }
}