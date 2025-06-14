import 'dart:async';

import 'package:flutter/material.dart';

class StreamTextField extends StatelessWidget {
   StreamTextField({super.key});
TextEditingController textEditingController=TextEditingController();
StreamController streamController=StreamController.broadcast();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              StreamBuilder(
                stream: streamController.stream,
                builder: (context, asyncSnapshot) {
                  if (asyncSnapshot.hasData) {
                    return Text("listener 1 ${asyncSnapshot.data}");
                  } else {
                    return LinearProgressIndicator();
                  };
                }
              ),
                 SizedBox(height: 20),
                     StreamBuilder(
                stream: streamController.stream,
                builder: (context, asyncSnapshot) {
                  if (asyncSnapshot.hasData) {
                    return Text("listener 2 ${asyncSnapshot.data}");
                  } else {
                 return    CircularProgressIndicator();
                  };
                }
              ),
              
              SizedBox(height: 20),
             
              SizedBox(height: 20),
              TextField(controller:textEditingController ,),
              ElevatedButton(onPressed: (){
                streamController.add(textEditingController.text);
              }, child: Text("display text"))
            ],
          ),
        ),
      ),
    );
  }
}