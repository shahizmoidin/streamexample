import 'package:flutter/material.dart';
import 'package:streamexample/broadcaststream.dart';
import 'package:streamexample/broadcasttextfeild.dart';
import 'package:streamexample/singlestream.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
   MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home:StreamTextField(),
    );
  }
}
