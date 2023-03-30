import 'dart:io';
import 'package:intl/intl.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import '../utils/dreams_constant.dart';

class SleepDataViewModel {


  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> sendToDatabase(String _sleepFeelings) async {
    final User? user = auth.currentUser;
    final uid = user?.uid;



    DatabaseReference ref = FirebaseDatabase.instance.ref("users/");

    // Update user with new sleep time entry
    await ref.update({
      uid!: {
        "sleep-information": {
          _sleepFeelings
        }
      }
    });
  }


}