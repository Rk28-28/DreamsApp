import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class SleepDataViewViewModel {
  FirebaseAuth auth = FirebaseAuth.instance;

  String dataEntry = "";
  int count = 0;

  getuid() {
    final User? user = auth.currentUser;
    final uid = user?.uid;
    return uid;
  }

  Future<String> loadUserData(String date) async {
    final x = getuid();
    DatabaseReference databaseRefData =
    FirebaseDatabase.instance.ref('users/$x//');

    final snapshot = await databaseRefData.child(date).get();

    if (snapshot.exists) {
      return snapshot.value.toString();
    } else {
      return 'No data available.';
    }
  }
}
