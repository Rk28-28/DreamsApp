import 'package:intl/intl.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:units/dreams/views/sleep_diary_view/dreams_sleep_diary_component.dart';

class SleepDiaryViewModel {

  FirebaseAuth auth = FirebaseAuth.instance;

  String diaryEntry = "";

  Future<void> sendToDatabase(String diaryEntryIn) async {
    final User? user = auth.currentUser;
    final uid = user?.uid;

    // Format date for database
    DateTime now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String dateStr = formatter.format(now);

    // Convert sleep time to string


    DatabaseReference ref = FirebaseDatabase.instance.ref("users/");

    // Update user with new sleep time entry
    await ref.update({
      uid!: {
        "diary-entries": {
          dateStr : diaryEntryIn,
        }
      }
    });
  }
}
