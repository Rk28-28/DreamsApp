import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class SleepTimeChart extends StatelessWidget{
  final List<charts.Series<dynamic, DateTime>> sleepTimeSeriesList;
  FirebaseAuth auth = FirebaseAuth.instance;
  final bool animate;
  int sleepTime = 0;

  SleepTimeChart(this.sleepTimeSeriesList, {required this.animate});

  factory SleepTimeChart.withSampleData() {
    return new SleepTimeChart(
      _createSampleData(),
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context){
    return new charts.TimeSeriesChart(
      sleepTimeSeriesList,
      animate: animate,
    );
  }

  static List<charts.Series<SleepTimeData, DateTime>> _createSampleData() {
    final data = [
      new SleepTimeData(new DateTime(2017, 9, 19), 5),
      new SleepTimeData(new DateTime(2017, 9, 26), 25),
      new SleepTimeData(new DateTime(2017, 10, 3), 100),
      new SleepTimeData(new DateTime(2017, 10, 10), 75),
    ];

    return [
      new charts.Series<SleepTimeData, DateTime>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (SleepTimeData date, _) => date.dateTime,
        measureFn: (SleepTimeData sleepData, _) => sleepData.sleepTime,
        data: data,
      )
    ];
  }

  Future<void> populateSleepTimeList() async {
    final User? user = auth.currentUser;
    final uid = user?.uid;

    var response = FirebaseDatabase.instance.ref("users/$uid/sleep-times");
    response.onChildAdded;

    DatabaseEvent event = await response.once();


  }
}

class SleepTimeData {
  int sleepTime;
  DateTime dateTime;

  SleepTimeData(this.dateTime, this.sleepTime);
}