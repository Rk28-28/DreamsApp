import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SleepDataPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

        ],
      ),
    );
  }
  Container gradient() {
    return Container( // Gradient for background
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.tealAccent,
                Colors.blue,
              ]
          )
      ),
    );
  }
}