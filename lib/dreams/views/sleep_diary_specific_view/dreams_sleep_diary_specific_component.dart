import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:units/dreams/presenter/dreams_sleep_diary_specific_presenter.dart';
import 'package:units/dreams/views/sleep_diary_specific_view/dreams_sleep_diary_specific_view.dart';
import 'package:units/dreams/viewmodel/dreams_sleep_diary_specific_viewmodel.dart';
import 'package:intl/intl.dart';
import 'package:units/dreams_home_page.dart';

class SleepDiarySpecificHomePage extends StatefulWidget{
  final SleepDiarySpecificPresenter sleepDiarySpecificPresenter;

  SleepDiarySpecificHomePage(this.sleepDiarySpecificPresenter, {required Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _SleepDiarySpecificHomePageState createState() => _SleepDiarySpecificHomePageState();
}
late final SleepDiarySpecificPresenter sleepDiaryPresenter;
TextEditingController diaryEntrySpecificController = new TextEditingController(); //To be used to grab input from date text field
TextEditingController txtController = new TextEditingController();
final regex = RegExp(r"\d{4}\-(0[1-9]|1[012])\-(0[1-9]|[12][0-9]|3[01])"); //Regex for checking validation of input - Will work on later
final _formKey = GlobalKey<FormState>(); //Used to check validation of input


class _SleepDiarySpecificHomePageState extends State<SleepDiarySpecificHomePage> implements SleepDiarySpecificView {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          title: Text('Find Specific Diary Entry'),
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
    Padding(
      padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
            mainAxisSize: MainAxisSize.min,

            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[

    Padding( //Text that displays "Enter a Date"
    padding: EdgeInsets.fromLTRB(16,32,16,16),
    child: Text(("Enter a Date:"),
    style: TextStyle(fontSize: 28.0, color:Colors.white), textAlign: TextAlign.center),
    ),

    Container( //Text box for typing in a date

    child: TextFormField(
      controller: diaryEntrySpecificController,
      maxLength: 10,

    style: TextStyle(fontSize: 18, color: Colors.white),
    textAlignVertical: TextAlignVertical.top,
    inputFormatters: <TextInputFormatter>[
    FilteringTextInputFormatter.deny(RegExp(r'\n')),
    ], // Only numbers can be entered

    decoration: InputDecoration(
    filled: true,
    fillColor: Colors.white.withOpacity(0.3),
    border: OutlineInputBorder(),
    hintText: 'Date must be of form "YYYY-MM-DD"',
    hintStyle: TextStyle(color: Colors.white),

    ),

      validator: (value) {
        if(value == null || value.isEmpty || !regex.hasMatch(value)) {
          return "Error: Input must be of form 'YYYY-MM-DD";
        }
        return null;
      },

    ),
    ),
              Padding(
                padding: EdgeInsets.fromLTRB(0,16,0,16),
                child: ElevatedButton(
                  onPressed:() {
                    //Print diary entry based on date in text field
                    if(_formKey.currentState!.validate())
                    {
                      Future<String> retrievedEntry = this.widget.sleepDiarySpecificPresenter.onSubmitClicked(diaryEntrySpecificController.text.toString());
                      retrievedEntry.then((String result){
                        setState(() {
                          txtController.text = result; //Future -> String
                        });
                      });

                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Fetching Data', style: TextStyle(color: Colors.white))));

                    }
                  },
                  child: const Text("Fetch Entry", style: TextStyle(fontSize: 18.0)),
                ),
              ),

              /*Padding( //Text that displays the diary entry
                padding: EdgeInsets.fromLTRB(16,32,16,16),
                child: TextField(
                    controller: txtController,
                    style: TextStyle(fontSize: 28.0, color:Colors.white), textAlign: TextAlign.center),
              ),*/

    ],
    ),
    ),
    ),
    ),
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
                    final data = snapshot.data as String;
                    //String x = loop(getdata());
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
          ],
      ),
    ),
    );
  }
}

  Future<String> getdata() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final uid = user?.uid;
    int i = 0;

    DocumentReference<Map<String, dynamic>> diaryRef = FirebaseFirestore
        .instance
        .collection('users')
        .doc(auth.currentUser?.uid).collection("sleep-diary").doc(diaryEntrySpecificController.text.toString());

    DocumentReference<Map<String, dynamic>> diaryRef1 = FirebaseFirestore
        .instance
        .collection('users')
        .doc(auth.currentUser?.uid).collection("sleep-behavior").doc(diaryEntrySpecificController.text.toString());

    String s = "";
    await diaryRef.get().then(
          (querySnapshot) {
        print("Successfully completed");
        if(querySnapshot.data().toString() == "null")
          {
            s += "No Sleep Diary for this date \n";
          }
        else
          {
            s+= querySnapshot.data().toString().substring(1,querySnapshot.data().toString().length-1) + "\n";
          }
        }
    );

    await diaryRef1.get().then(
            (querySnapshot) {
          print("Successfully completed");
          if(querySnapshot.data().toString() == "null")
    {
    s += "No Track Behaviors for this date\n";
    }
    else
    {
    s+= querySnapshot.data().toString().substring(1,querySnapshot.data().toString().length-1) + "\n";
    }
        }
    );

    return s;
  }

  String loop(String data) {
String s = data.toString();
    return s;
  }