import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../viewmodel/dreams_sleep_data_page_viewmodel.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'package:units/dreams/presenter/dreams_sleep_data_page_presenter.dart';

class SleepDataPage extends StatelessWidget {
  SleepDataPage(SleepDataPagePresenter sleepDataPagePresenter,
      {required String title, required Key key});

  SleepTimeData sleepData = SleepTimeData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sleep Data'), backgroundColor: Colors.black),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/sunbackground.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: FutureBuilder(
          future: sleepData.populateSleepTimeList(),
          builder: (context, future) {
            return Column(
              children: [
                Text(
                  "Sleep Duration over time",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Card(
                    child: SizedBox(
                      width: 400,
                      height: 300,
                      child: sleepData.getSleepTimeChart(),
                    ),
                  ),
                ),
                  Text(
                    " Average sleep time: " + sleepData.averageSleepTime.round().toString() + " hours",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  )
              ],);
          }
        ),
      ),
    );
  }
}
