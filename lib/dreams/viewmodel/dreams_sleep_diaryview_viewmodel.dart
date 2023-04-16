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

  }
}