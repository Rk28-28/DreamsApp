//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stack/stack.dart';
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
    ++count;
  }


  Future<void> loadUserData() async {
    final x = getuid();
    DatabaseReference databaseRefDiary = FirebaseDatabase.instance.ref(
        'users/$x/diary-entries/');
    //List val = [];
    //int counter =0;
   // List<String> locations = [];
    //final data = await databaseRefDiary.child("diary-entries").get();

    /*data.forEach((element) {
      final map2 = element.data();
      locations.add(map2[counter]);
      ++counter;
      });
    print(locations);*/

   /* await FirebaseFirestore.instance.collection('users/$x/diary-entries').get().then((event) {
      event.docs.forEach((doc) {
        locations.add(doc.data() as String);
      });
    });
    print(locations);*/
      //could store values into an array/list, and  run a for loop and send the 5 most recent entries.
    /*await databaseRefDiary.child("diary-entries").get().then((event) {
     event.value; //this stores all entries into 1 element, instead of a seperate element.
      ++counter;
      print(counter);
      print(val); //could store values into an array/list, and  run a for loop and send the 5 most recent entries.
    });*/
    
    Query query = databaseRefDiary.limitToLast(2);
    DataSnapshot event = await query.get();
    
    String data = event.value.toString();

    var entriesToPrint = ['', '', '', '', ''];
    int commaPos = 0;
    int entryPos = 0;

    data = data.substring(2, data.length - 2); //Cuts off [{ ... }] at the end of the string
    for(int i = 0; i < data.length; ++i)
      {
        if(entryPos >= 5)
          break;
        if(data.substring(i, i+1) == ",")
          {
            entriesToPrint[entryPos] = data.substring(commaPos + 1, i-1);
            commaPos = i;
            entryPos++;
          }
      }


    //event.count;
for(String entry in entriesToPrint) {print(entry);}

  }
}


