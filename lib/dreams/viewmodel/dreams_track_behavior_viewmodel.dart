
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
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

    DocumentReference<Map<String, dynamic>> sleepBehaviorRef = FirebaseFirestore.instance.collection('users')
        .doc(auth.currentUser?.uid).collection('sleep-behavior').doc(dateStr);

    sleepBehaviorRef.set({
      'Calories': calories,
      'Caffeine': caffeineconsumpted,
      'Mood': moodval
    });
  }
  BehaviorTrackViewModel();
}
