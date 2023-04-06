
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import '../views/behavior_track_views/dreams_track_behavior_component.dart';

import '../utils/dreams_constant.dart';

class BehaviorTrackViewModel {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> sendToDatabase(String calories, String caffeineconsumpted, double moodval) async {
    final User? user = auth.currentUser;
    final uid = user?.uid;


    DateTime now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String dateStr = formatter.format(now);

    //DatabaseReference ref = FirebaseDatabase.instance.ref("users/");

    final moodData = {
       dateStr : moodval
    };

    final caffeineData = {
      dateStr: caffeineconsumpted
    };

    final calorieData = {
      dateStr: calories
    };
    DatabaseReference databaseRefCal = FirebaseDatabase.instance.ref('users/$uid/calorie-values/');
    DatabaseReference databaseRefCaf = FirebaseDatabase.instance.ref('users/$uid/caffeine-values/');
    DatabaseReference databaseRefMood = FirebaseDatabase.instance.ref('users/$uid/mood-values/');


    databaseRefCal.update(calorieData);
    databaseRefCaf.update(caffeineData);
    databaseRefMood.update(moodData);


  }
  BehaviorTrackViewModel();
}
