import 'package:flutter/material.dart';

class SingleStream extends StatelessWidget {
  SingleStream({super.key});
  final Stream<int> numberStream = Stream.periodic(
    Duration(seconds: 4),
    (count) => count,
  ).take(10);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StreamBuilder<int>(
              stream: numberStream,
              builder: (context, asyncSnapshot) {
                if (asyncSnapshot.hasData) {
                  return Text("${asyncSnapshot.data}");
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
             StreamBuilder<int>(
              stream: numberStream,
              builder: (context, asyncSnapshot) {
                if (asyncSnapshot.hasData) {
                  return Text("${asyncSnapshot.data}");
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
