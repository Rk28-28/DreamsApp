import 'dart:io';
import 'package:intl/intl.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import '../utils/dreams_constant.dart';

class SleepTrackViewModel {
  double _units = 0.0;
  UnitType _unitType = UnitType.WAKE;
  UnitType _unitTypeTime = UnitType.AM;

  String _timeType = "";
  String _message = "";

  double bedHour = 0.0;
  double bedMinute = 0.0;
  double wakeHour = 0.0;
  double wakeMinute = 0.0;
  double sleepRating = 0.0;

  FirebaseAuth auth = FirebaseAuth.instance;

  double get units => _units;
  set units(double outResult){
    _units = outResult;
  }

  String get timeType => _timeType;
  set timeType(String outResult){
    _timeType = outResult;
  }

  String get message => _message;
  set message(String outResult){
    _message = outResult;
  }

  UnitType get unitTypeTime => _unitTypeTime;
  set unitTypeTime(UnitType setValue){
    _unitTypeTime = setValue;
  }

  UnitType get unitType => _unitType;
  set unitType(UnitType setValue){
    _unitType = setValue;
  }

  int get value => _unitType == UnitType.WAKE?0 : 1; //Set unit type - 1 is KPG
  set value(int value){
    if(value == 0){
      _unitType = UnitType.WAKE;
    } else {
      _unitType = UnitType.BED;
    }
  }

  int get valueWakeTime => _unitTypeTime == UnitType.AM?0 : 1; //Set unit type - 1 is KPG
  set valueWakeTime(int value){
    if(value == 0){
      _unitTypeTime = UnitType.AM;
    } else {
      _unitTypeTime = UnitType.PM;
    }
  }
  int get valueBedTime => _unitTypeTime == UnitType.AM?0 : 1; //Set unit type - 1 is KPG
  set valueBedTime(int value){
    if(value == 0){
      _unitTypeTime = UnitType.AM;
    } else {
      _unitTypeTime = UnitType.PM;
    }
  }

  Future<void> sendToDatabase(double sleepTime) async {
    final User? user = auth.currentUser;
    final uid = user?.uid;

    // Format date for database
    DateTime now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String dateStr = formatter.format(now);

    // Convert sleep time to string
    String sleepTimeStr = sleepTime.toString();

    DatabaseReference ref = FirebaseDatabase.instance.ref("users/");

    // Update user with new sleep time entry
    DatabaseReference databaseRefSleepTime = FirebaseDatabase.instance.ref('users/$uid/sleep-times/');

    final sleepTimeData = {
      dateStr : sleepTimeStr
    };

    final Map<String, Map> updateToSleepTime = {};

    updateToSleepTime['$dateStr'] = sleepTimeData;

    databaseRefSleepTime.update(updateToSleepTime);
  }


  String get timeInString => _timeType;
  String get messageInString => _message;
  String get resultInString => units.toStringAsFixed(2);
  String get wakeHourInString => wakeHour != null ? wakeHour.toString():'';
  String get wakeMinuteInString => wakeMinute != null ? wakeMinute.toString():'';

  SleepTrackViewModel();
}