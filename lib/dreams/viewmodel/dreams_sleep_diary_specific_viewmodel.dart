import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:units/dreams/views/sleep_diary_specific_view/dreams_sleep_diary_specific_component.dart';

class SleepDiarySpecificViewModel {

  FirebaseAuth auth = FirebaseAuth.instance;

  String diaryEntry = "";
  int count = 0;

  getuid() {
    final User? user = auth.currentUser;
    final uid = user?.uid;
    return uid;
  }

  Future<String> loadUserData(String date) async {
    final x = getuid();
    DatabaseReference databaseRefDiary = FirebaseDatabase.instance.ref(
        'users/$x/diary-entries/');

    final snapshot = await databaseRefDiary.child(date).get();

    if (snapshot.exists) {
      return snapshot.value.toString();
    } else {
      return 'No data available.';
    }
  }
}