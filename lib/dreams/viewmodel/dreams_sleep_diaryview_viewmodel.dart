import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class SleepDiaryViewModel {
  FirebaseAuth auth = FirebaseAuth.instance;

  String diaryEntry = "";
  int count = 0;
  getuid() {
    final User? user = auth.currentUser;
    final uid = user?.uid;
    return uid;
  }
  List<String> loadUserData()  {
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

    Query query = databaseRefDiary.limitToLast(5);
    DataSnapshot event = query.get() as DataSnapshot;

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
        entriesToPrint[entryPos] = data.substring(commaPos + 1, i);
        commaPos = i;
        entryPos++;
      }
    }
    return entriesToPrint;


    //event.count;
    for(String entry in entriesToPrint) {print(entry);}


  }
}