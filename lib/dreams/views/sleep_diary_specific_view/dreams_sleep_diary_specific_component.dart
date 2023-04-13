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
TextEditingController diaryEntrySpecificController = new TextEditingController(); //To be used to grab input from diary entry text field
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

    );
  }

}

