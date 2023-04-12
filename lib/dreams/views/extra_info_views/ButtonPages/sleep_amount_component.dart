import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../MyWebView.dart';
import '../CloudButtonEI.dart';

class SleepAmountHomePage extends StatefulWidget{

  SleepAmountHomePage({required Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _SleepAmountHomePageState createState() => _SleepAmountHomePageState();
}

class _SleepAmountHomePageState extends State<SleepAmountHomePage> {
  var txt = TextEditingController();
  List<String> ageRanges = <String>['1-2 years', '3-5 years', '6-12 years', '13-18 years', '18-60 years', '61-64 years', '65+ years'];
  String recommendedSleep = "Recommended amount of sleep: ";

  @override
  Widget build(BuildContext context) {
    var agePicked;
    return Scaffold(
      appBar: AppBar(
        title: Text(recommendedSleep),
          backgroundColor: Colors.black

      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/backgrounds/blueplanetbg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column (
            children: <Widget>[

        Container(
          height: 600.0,
        //decoration: BoxDecoration( color: Colors.white70),
        child : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                  padding: EdgeInsets.fromLTRB(16, 32, 16, 16),
                  child: Text('ENTER YOUR AGE:',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 26.0,
                      color: Colors.white
                    ),
                  )
              ),

              Container(
                decoration: BoxDecoration( color: Colors.white70),
                child: DropdownButton<String>(
                    hint: Text("Select Age"),
                    value: agePicked,
                    items: ageRanges.map<DropdownMenuItem<String>>((String value){

                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        agePicked = newValue;
                      });
                      print(agePicked);
                      String sleep = _calculateRecommendedSleep(agePicked);
                      txt.text = sleep;
                    }),
              ),
              Container(

                child: TextField(
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 26.0,
                      color: Colors.white
                  ),
                  controller: txt,
                ),
              )
            ]
        ),
      ),

            ]
        ),
      ),
    );
  }


  @override
  void initState() {
    super.initState();
  }

}

String _calculateRecommendedSleep(String age) {
  var sleepAmount;
  if(age == "1-2 years") {
    sleepAmount = "11-14 hours";
  }
  else if(age == "3-5 years") {
    sleepAmount = "10-13 hours";
  }
  else if(age == "6-12 years") {
    sleepAmount = "9-12 hours";
  }
  else if(age == "13-18 years") {
    sleepAmount = "8-10 hours";
  }
  else if(age == "18-60 years") {
    sleepAmount = "7+ hours";
  }
  else if(age == "61-64 years") {
    sleepAmount = "7-9 hours";
  }
  else if(age == "65+ years") {
    sleepAmount = "7-8 hours";
  }
  return sleepAmount;
}