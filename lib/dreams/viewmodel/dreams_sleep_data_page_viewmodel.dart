import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class SleepTimeData {
  FirebaseAuth auth = FirebaseAuth.instance;
  List<_SleepTimeDataPoint> _sleepTimeData = [];
  double _averageSleepTime = 0;
  int _averageCaffeine = 0;

  int get averageCaffeine => _averageCaffeine;
  double get averageSleepTime => _averageSleepTime;

  Future<void> getDatabaseData() async {
    _sleepTimeData.clear();
    final User? user = auth.currentUser;
    final uid = user?.uid;

    await FirebaseFirestore.instance.collection('users').doc(uid).collection('sleep-track')
    .get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((doc) {
        DateTime dateTime = DateTime.parse(doc.id);
        _sleepTimeData
            .add(new _SleepTimeDataPoint(dateTime, doc["Sleep Time"]));
      });
    });
    _getSleepTimeAverage();
  }

  Future<void> findAverageCaffeine() async {
    final User? user = auth.currentUser;
    final uid = user?.uid;

    List<int> caffeineData = [];

    await FirebaseFirestore.instance.collection('users').doc(uid).collection('sleep-behavior')
        .get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((doc) {
        caffeineData.add(int.parse(doc["Caffeine"]));
      });
    });
    _averageCaffeine = _calculateAverage(caffeineData);
  }

  _SleepTimeChart getSleepTimeChart() {
    return _SleepTimeChart(this);
  }

  int _calculateAverage(List<dynamic> list) {
    double averageTmp = 0;

    for (dynamic data in list) {
      averageTmp += data;
    }

    print(averageTmp);
    return (averageTmp / list.length).round();
  }

  void _getSleepTimeAverage() {
    double averageSleepTimeTemp = 0;

    for (_SleepTimeDataPoint dataPoint in _sleepTimeData) {
      averageSleepTimeTemp += dataPoint.sleepTime;
    }

    _averageSleepTime = (averageSleepTimeTemp / _sleepTimeData.length);
  }
}

class _SleepTimeChart extends StatelessWidget {
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

  List<charts.Series<_SleepTimeDataPoint, DateTime>> createChart() {
    return [
      new charts.Series<_SleepTimeDataPoint, DateTime>(
        id: 'Sleep Times',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (_SleepTimeDataPoint data, _) => data.dateTime,
        measureFn: (_SleepTimeDataPoint data, _) => data.sleepTime,
        data: dataSet._sleepTimeData,
      )
    ];
  }
}

class _SleepTimeDataPoint {
  late double sleepTime;
  late DateTime dateTime;

  _SleepTimeDataPoint(this.dateTime, this.sleepTime);
}
