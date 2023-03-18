import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:units/dreams/presenter/dreams_sleep_data_presenter.dart';
import 'dreams_sleep_data_view.dart';

class SleepDataHomePage extends StatefulWidget{
  final SleepDataPresenter sleepdataPresenter;

  SleepDataHomePage(this.sleepdataPresenter, {required Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _SleepDataHomePageState createState() => _SleepDataHomePageState();
}

class _SleepDataHomePageState extends State<SleepDataHomePage> implements SLEEPDATAView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sleep Data'),
          // TODO: Implement SleepData home page
        )
    );
  }

  @override
  void initState() {
    super.initState();
    this.widget.sleepdataPresenter.SleepDataView = this;
  }


}
