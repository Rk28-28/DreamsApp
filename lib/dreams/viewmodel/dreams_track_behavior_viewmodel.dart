
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import '../views/behavior_track_views/dreams_behavior_view.dart';

import '../utils/dreams_constant.dart';

class BehaviorTrackViewModel {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> sendToDatabase(String calories, String caffeineconsumpted, double moodval) async {
    final User? user = auth.currentUser;
    final uid = user?.uid;

    String calorie = calories;
    String caf = caffeineconsumpted;
    double slidval = moodval;
    DatabaseReference ref = FirebaseDatabase.instance.ref("users/");

    // Update user with new sleep time entry
    await ref.update({
      uid!: {
        "Calorie-Data": {
          calorie: calories
        },
        "Caffeine-Consumption": {
          caf:caffeineconsumpted
        },
        "Mood-Value":{
          slidval: moodval
        }
      }
    });
  }
  BehaviorTrackViewModel();
}
