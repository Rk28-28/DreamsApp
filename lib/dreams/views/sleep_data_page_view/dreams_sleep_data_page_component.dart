import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../viewmodel/dreams_sleep_data_page_viewmodel.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'package:units/dreams/presenter/dreams_sleep_data_page_presenter.dart';

class SleepDataPage extends StatelessWidget {
  SleepDataPage(SleepDataPagePresenter sleepDataPagePresenter,
      {required String title, required Key key});

  SleepTimeChart sleepTimeChart = SleepTimeChart();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sleep Data'), backgroundColor: Colors.black),
      body: Column(
        children: [
          Expanded(child: sleepTimeChart),
          Expanded(child: background()),
        ],
      ),
    );
  }

  Container background() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/sunbackground.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
