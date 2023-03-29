import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:units/dreams/presenter/dreams_sleep_diary_presenter.dart';
import 'package:units/dreams/views/sleep_diary_view/dreams_sleep_diary_view.dart';

class SleepDiaryHomePage extends StatefulWidget{
  final SleepDiaryPresenter sleepDiaryPresenter;

  SleepDiaryHomePage(this.sleepDiaryPresenter, {required Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _SleepDiaryHomePageState createState() => _SleepDiaryHomePageState();
}

class _SleepDiaryHomePageState extends State<SleepDiaryHomePage> implements SleepDiaryView {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
        title: Text('Sleep Diary Page'),
    // TODO: Implement Sleep Diary Page home page
    ),
    // TODO: implement build
   // throw UnimplementedError();
    );
  }
}
