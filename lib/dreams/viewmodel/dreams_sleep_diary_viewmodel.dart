//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:units/dreams/views/sleep_diary_view/dreams_sleep_diary_component.dart';

class SleepDiaryViewModel {

  FirebaseAuth auth = FirebaseAuth.instance;

  String diaryEntry = "";
  int count = 0;

  Future<void> sendToDatabase(String diaryEntryIn) async {
    final User? user = auth.currentUser;
    final uid = user?.uid;

    // Format date for database
    DateTime now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String dateStr = formatter.format(now);

    DocumentReference<Map<String, dynamic>> diaryRef = FirebaseFirestore
        .instance.collection('users')
        .doc(auth.currentUser?.uid).collection('sleep-diary').doc(dateStr);

    diaryRef.set({
      '$dateStr' : diaryEntryIn,
    });
  }
}