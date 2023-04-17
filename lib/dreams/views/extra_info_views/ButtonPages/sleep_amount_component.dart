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
  var sleepTextEdit = TextEditingController();
  var calorieTextEdit = TextEditingController();
  var caffeineTextEdit = TextEditingController();

  List<String> ageRanges = <String>['0-3 months', '4-12 months', '1-2 years', '3-5 years', '6-12 years', '13-18 years', '18-60 years', '61-64 years', '65+ years'];
  String recommendedSleep = "Recommendations: ";

  @override
  Widget build(BuildContext context) {
    var agePicked;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(recommendedSleep),
          backgroundColor: Colors.black

      ),
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/backgrounds/moonbg.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column (
              children: <Widget>[

          Container(
            height: 300.0,
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
                  width: 125.0,
                  child: DropdownButtonFormField<String>(
                      hint: Text("Select Age"),
                      value: agePicked,
                      items: ageRanges.map<DropdownMenuItem<String>>((String value){

                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          agePicked = value;
                        });
                      print(agePicked);
                      String sleep = _calculateRecommendedSleep(agePicked);
                      sleepTextEdit.text = sleep;
                      String calories = _calculateRecommendedCalories(agePicked);
                      calorieTextEdit.text = calories;
                      String caffeine = _calculateRecommendedCaffeine(agePicked);
                      caffeineTextEdit.text = caffeine;
                      }),

                ),
                Container(
                  child: const Padding(
                      padding: EdgeInsets.fromLTRB(16, 32, 16, 16),
                      child: Text('RECOMMENDED AMOUNT OF SLEEP:',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20.0,
                            color: Colors.white
                        ),
                      )
                  ),
                ),
                Container(
                  child: TextField(
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 26.0,
                        color: Colors.white
                    ),
                    controller: sleepTextEdit,
                  ),

                ),
                Container(
                  child: const Padding(
                      padding: EdgeInsets.fromLTRB(16, 32, 16, 16),
                      child: Text('RECOMMENDED AMOUNT OF CALORIES:',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20.0,
                            color: Colors.white
                        ),
                      )
                  ),
                ),
                Container(
                  child: TextField(
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 26.0,
                        color: Colors.white
                    ),
                    controller: calorieTextEdit,
                  ),

                ),
                Container(
                  child: const Padding(
                      padding: EdgeInsets.fromLTRB(16, 32, 16, 16),
                      child: Text('RECOMMENDED AMOUNT OF CAFFEINE:',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20.0,
                            color: Colors.white
                        ),
                      )
                  ),
                ),
                Container(
                  child: TextField(
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 26.0,
                        color: Colors.white
                    ),
                    controller: caffeineTextEdit,
                  ),

                ),
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
  if(age == "0-3 months") {
    sleepAmount = "14-17 hours";
  }
  else if(age == "4-12 months") {
    sleepAmount = "12-16 hours";
  }
  else if(age == "1-2 years") {
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

String _calculateRecommendedCalories(String age) {
  var calorieAmount;
  if(age == "0-3 months" || age == "4-12 months") {
    calorieAmount = "100 CAL/KG/DAY";
  }
  else if(age == "1-2 years") {
    calorieAmount = "80 CAL/KG/DAY";
  }
  else if(age == "3-5 years") {
    calorieAmount = "70 CAL/KG/DAY";
  }
  else if(age == "6-12 years") {
    calorieAmount = "45-65 CAL/KG/DAY";
  }
  else if(age == "13-18 years") {
    calorieAmount = "35-45 CAL/KG/DAY";
  }
  else if(age == "18-60 years" || age == "61-64 years" || age == "65+ years") {
    calorieAmount = "2200-2600 CAL/DAY";
  }
  return calorieAmount;
}

String _calculateRecommendedCaffeine(String age) {
  var caffeineAmount;
  if(age == "0-3 months" || age == "4-12 months" || age == "1-2 years" || age == "3-5 years" || age == "6-12 years") {
    caffeineAmount = "NONE";
  }
  else if(age == "13-18 years") {
    caffeineAmount = "NO MORE THAN 100mg";
  }
  else if(age == "18-60 years" || age == "61-64 years" || age == "65+ years") {
    caffeineAmount = "NO MORE THAN 400mg";
  }
  return caffeineAmount;
}