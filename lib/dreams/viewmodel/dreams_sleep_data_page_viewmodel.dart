import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class SleepTimeChart extends StatelessWidget{
  late List<SleepTimeData> sleepTimeData = [];
  List<charts.Series> sleepTimeSeriesList = [];
  FirebaseAuth auth = FirebaseAuth.instance;
  bool animate = false;
  int sleepTime = 0;

  SleepTimeChart(){
    populateSleepTimeList();
  }

  @override
  Widget build(BuildContext context) {
    return new charts.TimeSeriesChart(
      _createSampleData(),
      animate: true,
    );
  }

  Future<void> populateSleepTimeList() async {
    final User? user = auth.currentUser;
    final uid = user?.uid;
    bool finished = false;

    FirebaseFirestore.instance.collection('users').doc(uid).collection('sleep-track')
      .get().then((QuerySnapshot snapshot) {
        snapshot.docs.forEach((doc) {
          DateTime dateTime = DateTime.parse(doc.id);
          sleepTimeData.add(SleepTimeData(dateTime, doc["Sleep Time"]));
        });
    });

  }

  List<charts.Series<SleepTimeData, DateTime>> createChart(){
    return [
      new charts.Series(
        id: 'Sleep Times',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (SleepTimeData data, _) => data.dateTime,
        measureFn: (SleepTimeData data, _) => data.sleepTime,
        data: sleepTimeData,
      )];
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
        id: 'Sleep Time',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (SleepTimeData data, _) => data.dateTime,
        measureFn: (SleepTimeData data, _) => data.sleepTime,
        data: data,
      )
    ];
  }
}

class SleepTimeData {
  double sleepTime;
  DateTime dateTime;

  SleepTimeData(this.dateTime, this.sleepTime);
}