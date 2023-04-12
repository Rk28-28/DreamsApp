import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../presenter/dreams_extra_info_presenter.dart';
import 'extra_info_view.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';
import 'MyWebView.dart';
import 'CloudButtonEI.dart';

class ExtraInfoHomePage extends StatefulWidget{
  final EXTRAINFOPresenter extraInfoPresenter;

  ExtraInfoHomePage(this.extraInfoPresenter, {required Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _ExtraInfoHomePageState createState() => _ExtraInfoHomePageState();
}

class _ExtraInfoHomePageState extends State<ExtraInfoHomePage> implements EXTRAINFOView {
  var txt = TextEditingController();
  String _url = 'url';
  //List<String> ageRanges = <String>['1-2 years', '3-5 years', '6-12 years', '13-18 years', '18-60 years', '61-64 years', '65+ years'];
  List<DropdownMenuItem<String>> ageRanges = [
    DropdownMenuItem(child: Text("1-2 years"), value: "1-2 years"),
    DropdownMenuItem(child: Text("3-5 years"), value: "3-5 years"),
    DropdownMenuItem(child: Text("6-12 years"), value: "6-12 years"),
    DropdownMenuItem(child: Text("13-18 years"), value: "13-18 years"),
    DropdownMenuItem(child: Text("18-60 years"), value: "18-60 years"),
    DropdownMenuItem(child: Text("61-64 years"), value: "61-64 years"),
    DropdownMenuItem(child: Text("65+ years"), value: "65+ years"),
  ];

  @override
  Widget build(BuildContext context) {
    var agePicked;
    return Scaffold(
        appBar: AppBar(
        title: Text('Extra Information'),

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
        decoration: BoxDecoration( color: Colors.white70),
        child : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                  padding: EdgeInsets.fromLTRB(16, 32, 16, 16),
                  child: Text('Enter your age to see your recommended amount of sleep:',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18.0,
                        //backgroundColor: Colors.white70
                    ),
                  )
              ),

              Container(
                //decoration: BoxDecoration( color: Colors.white70),

                child: DropdownButton<String>(
                    hint: Text("Select Age"),
                    value: agePicked,
                    onChanged: (String? newValue) {
                      setState(() {
                        agePicked = newValue!;
                      });
                      print(agePicked);
                      String sleep = _calculateRecommendedSleep(agePicked);
                      txt.text = sleep;
                    },
                    items: ageRanges),
              ),
              Container(
                //decoration: BoxDecoration( color: Colors.white70),
                child: TextField(
                  controller: txt,
                ),
              )
            ]
        ),
      ),



        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center (
                child: CloudButton (
                    text: "Tips for Better Sleep",
                    onPressed: () {
                      _url = 'https://www.cdc.gov/sleep/about_sleep/sleep_hygiene.html';
                      _navigateToWebView(context, _url);
                    },
                    imageAsset: 'assets/cloud-clipart-md.png',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center (
                child: CloudButton (
                    text: "Health Benefits of Sleep",
                    onPressed: () {
                      _url = 'https://www.sleepfoundation.org/how-sleep-works/benefits-of-sleep';
                      _navigateToWebView(context, _url);
                    },
                  imageAsset: 'assets/cloud-clipart-md.png',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center (
                child: CloudButton (
                    text: "Nighttime Routine Tips",
                    onPressed: () {
                      _url = 'https://www.sleepfoundation.org/sleep-hygiene/bedtime-routine-for-adults';
                      _navigateToWebView(context, _url);
                    },
                  imageAsset: 'assets/cloud-clipart-md.png',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center (
                child: CloudButton (
                    text: "Not Enough Sleep Effects",
                    onPressed: () {
                      _url = 'https://www.healthline.com/health/sleep-deprivation/effects-on-body#Respiratory-system';
                      _navigateToWebView(context, _url);
                    },
                  imageAsset: 'assets/cloud-clipart-md.png',
                ),
              ),
            ),
          ]
        )
    ]
    )
    )
    );
  }


  @override
  void initState() {
    super.initState();
    this.widget.extraInfoPresenter.extraInfoView = this;
  }

  set extraInfoView(EXTRAINFOView value) {
  }

}
void _navigateToWebView(BuildContext context, String url) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => MyWebView(url: url),
    ),
  );
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



