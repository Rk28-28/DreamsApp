import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:units/dreams/views/sleep_diary_view/dreams_sleep_diary_component.dart';

class SleepDiaryViewModel {

  FirebaseAuth auth = FirebaseAuth.instance;

  String diaryEntry = "";

  getuid() {
    final User? user = auth.currentUser;
    final uid = user?.uid;
    return uid;
  }
  Future<void> sendToDatabase(String diaryEntryIn) async {
    final x = getuid();
    // Format date for database
    DateTime now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String dateStr = formatter.format(now);

    DatabaseReference databaseRefDiary = FirebaseDatabase.instance.ref(
        'users/$x/diary-entries/');

    final diaryData = {
      dateStr: diaryEntryIn
    };

    databaseRefDiary.update(diaryData);
  }


  Future<void> loadUserData() async {
    final x = getuid();
    DatabaseReference databaseRefDiary = FirebaseDatabase.instance.ref(
        'users/$x/');
    await databaseRefDiary.child("diary-entries").get().then((event) {
      print(event.value); //could store values into an array/list, and  run a for loop and send the 5 most recent entries.
    });
  }
}



