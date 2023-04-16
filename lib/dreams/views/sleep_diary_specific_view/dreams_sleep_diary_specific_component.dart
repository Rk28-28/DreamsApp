import 'package:cloud_firestore/cloud_firestore.dart';
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
//final regex = RegExp(r""); //Regex for checking validation of input - Will work on later
final _formKey = GlobalKey<FormState>(); //Used to check validation of input


class _SleepDiarySpecificHomePageState extends State<SleepDiarySpecificHomePage> implements SleepDiarySpecificView {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
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
    child: Padding(
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

    ),
    ),
              Padding(
                padding: EdgeInsets.fromLTRB(0,16,0,16),
                child: ElevatedButton(
                  onPressed:() {
                    //Print diary entry based on date in text field
                  },
                  child: const Text("Fetch Entry", style: TextStyle(fontSize: 18.0)),
                ),
              ),

    ],
    ),
    ),
    ),
    ),
    ),

    );
  }

}

