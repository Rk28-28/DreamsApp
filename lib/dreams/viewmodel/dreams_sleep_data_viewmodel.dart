import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import '../utils/dreams_constant.dart';

class SleepDataViewModel {


  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> sendToDatabase(String _sleepFeelings,int firstGroupValue, int secondGroupValue) async {
    final User? user = auth.currentUser;
    final uid = user?.uid;

    // Format date for database
    DateTime now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String dateStr = formatter.format(now);

    DocumentReference<Map<String, dynamic>> sleepInformationRef = FirebaseFirestore.instance.collection('users')
        .doc(auth.currentUser?.uid).collection('sleep-information').doc(dateStr);

    sleepInformationRef.collection('sleep-feelings').add({
      'Sleep Feelings': _sleepFeelings,
    });
    sleepInformationRef.collection('sleep-wake').add({
      'Wake Up': firstGroupValue,
    });
    sleepInformationRef.collection('sleep-dream').add({
      'Dream/Nightmare': secondGroupValue,
    });
  }


}