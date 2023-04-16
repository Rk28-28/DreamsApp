import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:units/dreams/presenter/dreams_sleep_diaryview_presenter.dart';
import 'package:units/dreams/views/sleep_diaryview_view/dreams_sleep_diaryview_view.dart';

import '../../presenter/dreams_sleep_diary_specific_presenter.dart';
import '../sleep_diary_specific_view/dreams_sleep_diary_specific_component.dart';

class SleepDiaryViewHomePage extends StatefulWidget {
  final SleepDiaryViewPresenter sleepDiaryViewPresenter;

  final String title;

  SleepDiaryViewHomePage(this.sleepDiaryViewPresenter,
      {required Key? key, required this.title})
      : super(key: key);
  @override
  _SleepDiaryViewHomePageState createState() => _SleepDiaryViewHomePageState();
}

class _SleepDiaryViewHomePageState extends State<SleepDiaryViewHomePage>
    implements SleepDiaryViewView {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Recent Entries'),
        backgroundColor: Colors.black
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/backgrounds/earthbg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            FutureBuilder(
              builder: (ctx, snapshot) {
                // Checking if future is resolved or not
                if (snapshot.connectionState == ConnectionState.done) {
                  // If we got an error
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        '${snapshot.error} occurred',
                        style: TextStyle(fontSize: 19),
                      ),
                    );

                    // if we got our data
                  } else if (snapshot.hasData) {
                    // Extracting data from snapshot object
                    final data = snapshot.data as List<String>;

                    return Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        loop(data),
                        style: TextStyle(fontSize: 14.4,color: Colors.white),


                      ),
                    );
                  }
                }

                // Displaying LoadingSpinner to indicate waiting state
                return Center(
                  child: CircularProgressIndicator(),
                );
              },

              // Future that needs to be resolved
              // inorder to display something on the Canvas
              future: getdata(),
            ),
            Container(
                child: Flexible(
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: ElevatedButton(
              child: const Text('View Specific Diary Entries',
                  style: TextStyle(fontSize: 18.0)),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return SleepViewSpecificDiaryScreen();
                }));
              },
            ))))
          ],
        ),
      ),
    ));
  }

  Future<List<String>> getdata() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final uid = user?.uid;
    int i = 0;

    DocumentReference<Map<String, dynamic>> diaryRef = FirebaseFirestore
        .instance
        .collection('users')
        .doc(auth.currentUser?.uid);

    List<String> x = [];
    await diaryRef.collection("sleep-diary").get().then(
      (querySnapshot) {
        print("Successfully completed");
        for (var docSnapshot in querySnapshot.docs) {
          x.insert(i, docSnapshot.data().toString());

          ++i;
        }
      },
      onError: (e) => print("Error completing: $e"),
    );
    return x;
  }

  String loop(List<String> data) {
    String str = "";
    int counter = 0;
    int len = data.length - 1;
    if (data.length < 5) {
      counter = 5-data.length;
    }

    while (counter < 5) {
      str += '\n' + data[len].substring(1,data[len].length-2) + '\n\n';
      --len;
      ++counter;
    }
    return str;
  }
}

class SleepViewSpecificDiaryScreen extends StatefulWidget {
  @override
  _SleepViewSpecificDiaryScreen createState() =>
      _SleepViewSpecificDiaryScreen();
}

class _SleepViewSpecificDiaryScreen
    extends State<SleepViewSpecificDiaryScreen> {
  @override
  Widget build(BuildContext context) {
    return new SleepDiarySpecificHomePage(
      new SleepDiarySpecificPresenter(),
      title: 'Sweet Dreams',
      key: Key("View Specific Entries"),
    );
  }
}
