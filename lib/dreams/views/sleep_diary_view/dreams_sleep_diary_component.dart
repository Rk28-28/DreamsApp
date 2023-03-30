import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:units/dreams/presenter/dreams_sleep_diary_presenter.dart';
import 'package:units/dreams/views/sleep_diary_view/dreams_sleep_diary_view.dart';
import 'package:intl/intl.dart';

class SleepDiaryHomePage extends StatefulWidget{
  final SleepDiaryPresenter sleepDiaryPresenter;

  SleepDiaryHomePage(this.sleepDiaryPresenter, {required Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _SleepDiaryHomePageState createState() => _SleepDiaryHomePageState();
}

  TextEditingController diaryEntryController = new TextEditingController(); //To be used to grab input from diary entry text field
  //final regex = RegExp(r""); //Regex for checking validation of input - Will work on later
  final _formKey = GlobalKey<FormState>(); //Used to check validation of input

  DateTime now = new DateTime.now();
  DateTime date = new DateTime(now.year, now.month, now.day); //Gets the current date
  String formattedDate = DateFormat('yyyy-MM-dd').format(now); //Formats the date


class _SleepDiaryHomePageState extends State<SleepDiaryHomePage> implements SleepDiaryView {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
        title: Text('Sleep Diary Page'),
    // TODO: Implement Sleep Diary Page home page
    ),
        body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
            key: _formKey,

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[

                Padding( //Text for displaying current date
                  padding: EdgeInsets.fromLTRB(16,32,16,16),
                  child: Text(("Today's Date: " + formattedDate),
                      style: TextStyle(fontSize: 28.0), textAlign: TextAlign.center),
                  ),

              Container( //Text box for typing in a diary entry
                width: 300,
                height: 400,
                  child: TextFormField(

                    controller: diaryEntryController,
                    maxLines: null,
                    expands: true,
                    keyboardType: TextInputType.multiline,
                    textAlignVertical: TextAlignVertical.top,
                    /* To be implemented
                    validator: (value) {
                      if(value == null || value.isEmpty|| !regex.hasMatch(value))
                        return "Error: ";

                      return null;
                    },*/

                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Talk about dreams you had, your sleeping habits, bedtime routines, etc.',
                      hintMaxLines: 2,
                    ),

                  ),
                ),

                Padding(
                  padding: EdgeInsets.fromLTRB(0,16,0,16),
                  child: ElevatedButton(
                    onPressed:() {/*To be implemented*/},
                    child: const Text("Submit", style: TextStyle(fontSize: 18.0)),
                  ),
                ),

                Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
                          onPressed: () { /*To be implemented*/},
                          child: const Text('View Diary Entries', style: TextStyle(fontSize: 18.0))
                      ),
                    )
                ),



              ],
            ),
          ),
        ),

    // TODO: implement build
   // throw UnimplementedError();
    );
  }
}
