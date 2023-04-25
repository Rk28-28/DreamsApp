import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

class SleepDataViewModel {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> sendToDatabase(
      String sleepFeelings, String _awaken, String _memory) async {
    final User? user = auth.currentUser;
    final uid = user?.uid;

    // Format date for database
    DateTime now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String dateStr = formatter.format(now);

    DocumentReference<Map<String, dynamic>> sleepInformationRef =
        FirebaseFirestore.instance
            .collection('users')
            .doc(auth.currentUser?.uid)
            .collection('sleep-information')
            .doc(dateStr);

    sleepInformationRef.set({
      'Wake Up': _awaken,
      'Dream or Nightmare': _memory,
      'Sleep Feelings': sleepFeelings,
    });
  }
}
