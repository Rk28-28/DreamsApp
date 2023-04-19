import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:units/dreams/presenter/dreams_sleep_diary_presenter.dart';
import 'package:units/dreams/presenter/dreams_sleep_diaryview_presenter.dart';
import 'package:units/dreams/views/sleep_diary_view/dreams_sleep_diary_view.dart';
import 'package:units/dreams/viewmodel/dreams_sleep_diary_viewmodel.dart';
import 'package:intl/intl.dart';
import 'package:units/dreams/views/sleep_diaryview_view/dreams_sleep_diaryview_component.dart';
import 'package:units/dreams_home_page.dart';

class SleepDiaryHomePage extends StatefulWidget{
  final SleepDiaryPresenter sleepDiaryPresenter;

  SleepDiaryHomePage(this.sleepDiaryPresenter, {required Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _SleepDiaryHomePageState createState() => _SleepDiaryHomePageState();
}
  late final SleepDiaryPresenter sleepDiaryPresenter;
  TextEditingController diaryEntryController = new TextEditingController(); //To be used to grab input from diary entry text field
  //final regex = RegExp(r""); //Regex for checking validation of input - Will work on later
  final _formKey = GlobalKey<FormState>(); //Used to check validation of input

  DateTime now = new DateTime.now();
  String formattedDate = DateFormat('yyyy-MM-dd').format(now); //Formats the date


class _SleepDiaryHomePageState extends State<SleepDiaryHomePage> implements SleepDiaryView {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
        appBar: AppBar(
        title: Text('Sleep Diary Page'),
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

                Padding( //Text for displaying current date
                  padding: EdgeInsets.fromLTRB(16,32,16,16),
                  child: Text(("Today's Date: " + formattedDate),
                      style: TextStyle(fontSize: 28.0, color:Colors.white), textAlign: TextAlign.center),
                  ),

              Container( //Text box for typing in a diary entry
                width: 300,
                height: 400,
                  child: TextFormField(
                    controller: diaryEntryController,
                    maxLines: null,
                    maxLength: 150,
                    expands: true,
                    keyboardType: TextInputType.multiline,
                    style: TextStyle(fontSize: 23, color: Colors.white),
                    textAlignVertical: TextAlignVertical.top,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.deny(RegExp(r'\n')),
                    ], // Only numbers can be entered

                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.3),
                      border: OutlineInputBorder(),
                      hintText: 'Talk about dreams you had, your sleeping habits, bedtime routines, etc.',
                      hintStyle: TextStyle(color: Colors.white),
                      hintMaxLines: 3,


                    ),

                  ),
                ),

                Padding(
                  padding: EdgeInsets.fromLTRB(0,16,0,16),
                  child: ElevatedButton(
                    onPressed:() {
                      this.widget.sleepDiaryPresenter.onSubmitClicked(getDiaryEntry());//Submits diary entry to database
                      //stores all the diary entries

                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')));
                    },
                    child: const Text("Submit", style: TextStyle(fontSize: 18.0)),
                  ),
                ),

                Flexible(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
                          child: const Text('View Diary Entries', style: TextStyle(fontSize: 18.0)),
                          onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                            return SleepViewDiaryScreen();
                          }));},

                      ),
                    )
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

class SleepViewDiaryScreen extends StatefulWidget {
  @override
  _SleepViewDiaryScreen createState() => _SleepViewDiaryScreen();
}

class _SleepViewDiaryScreen extends State<SleepViewDiaryScreen> {
  @override
  Widget build(BuildContext context) {
    return new SleepDiaryViewHomePage(new SleepDiaryViewPresenter(), title: 'Sweet Dreams', key: Key("View Sleep Diarys"),);
  }
}

  //Gets the diary entry
  String getDiaryEntry()
  {
    return diaryEntryController.text;
  }







