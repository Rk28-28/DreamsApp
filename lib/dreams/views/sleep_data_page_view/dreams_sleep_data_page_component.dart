import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:units/dreams/presenter/dreams_sleep_data_page_presenter.dart';

class SleepDataPage extends StatelessWidget {
  SleepDataPage(SleepDataPagePresenter sleepDataPagePresenter, {required String title, required Key key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sleep Data'),
      ),
      body: Column(
        children: [
         Expanded(child: container()),

        ],
      ),
    );
  }
  Container container() {
    return  Container(
    width: double.infinity,
    decoration: BoxDecoration(
    image: DecorationImage(
    image: AssetImage('assets/backgrounds/redplanetbg.png'),
    fit: BoxFit.cover,
    ),
    ),
    );
  }
}