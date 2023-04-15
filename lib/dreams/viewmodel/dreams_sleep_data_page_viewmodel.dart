import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class SleepTimeData {
  List<_SleepTimeDataPoint> _sleepTimeData = [];
  FirebaseAuth auth = FirebaseAuth.instance;
  double _averageSleepTime = 0;

  double get averageSleepTime => _averageSleepTime;

  Future<void> populateSleepTimeList() async {
    _sleepTimeData.clear();
    final User? user = auth.currentUser;
    final uid = user?.uid;

    await FirebaseFirestore.instance.collection('users').doc(uid).collection('sleep-track')
        .get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((doc) {
        DateTime dateTime = DateTime.parse(doc.id);
        _sleepTimeData.add(new _SleepTimeDataPoint(dateTime, doc["Sleep Time"]));
      });
    });
    _getSleepTimeAverage();
  }


  _SleepTimeChart getSleepTimeChart() {
    return _SleepTimeChart(this);
  }

  void _getSleepTimeAverage() {
    double averageSleepTimeTemp = 0;

    for ( _SleepTimeDataPoint dataPoint in _sleepTimeData) {
      averageSleepTimeTemp += dataPoint.sleepTime;
    }

    _averageSleepTime = (averageSleepTimeTemp / _sleepTimeData.length);
  }
}

class _SleepTimeChart extends StatelessWidget{
  SleepTimeData dataSet;

  _SleepTimeChart(this.dataSet);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 2,
      child: new charts.TimeSeriesChart(
        createChart(),
        animate: false,
        ),
    );
  }

  List<charts.Series<_SleepTimeDataPoint, DateTime>> createChart(){
    return [
      new charts.Series<_SleepTimeDataPoint, DateTime>(
        id: 'Sleep Times',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (_SleepTimeDataPoint data, _) => data.dateTime,
        measureFn: (_SleepTimeDataPoint data, _) => data.sleepTime,
        data: dataSet._sleepTimeData,
      )];
  }
}

class _SleepTimeDataPoint {
  late double sleepTime;
  late DateTime dateTime;

  _SleepTimeDataPoint(this.dateTime, this.sleepTime);
}