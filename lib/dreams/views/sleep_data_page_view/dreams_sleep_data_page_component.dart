import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:units/dreams/presenter/dreams_sleep_data_page_presenter.dart';

class SleepDataPage extends StatelessWidget {
  SleepDataPage(SleepDataPagePresenter sleepDataPagePresenter, {required String title, required Key key});

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