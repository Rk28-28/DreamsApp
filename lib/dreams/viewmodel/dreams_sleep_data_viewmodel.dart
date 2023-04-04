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

    // Format date for database
    DateTime now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd-ms');
    String dateStr = formatter.format(now);


    DatabaseReference databaseRefSleepData = FirebaseDatabase.instance.ref('users/$uid/sleep-information/');

    await databaseRefSleepData.update({
      dateStr : _sleepFeelings
    });
  }


}