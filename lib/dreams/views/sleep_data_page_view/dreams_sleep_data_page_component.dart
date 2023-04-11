import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../viewmodel/dreams_sleep_data_page_viewmodel.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'package:units/dreams/presenter/dreams_sleep_data_page_presenter.dart';

class SleepDataPage extends StatelessWidget {
  SleepDataPage(SleepDataPagePresenter sleepDataPagePresenter, {required String title, required Key key});
  
  SleepTimeChart sleepTimeChart = new SleepTimeChart.withSampleData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sleep Data'),
          backgroundColor: Colors.black
      ),
      body: Column(
        children: [
          Expanded(child: gradient()),
          Expanded(child: sleepTimeChart)

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