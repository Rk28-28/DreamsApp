import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:units/dreams/presenter/dreams_behavior_track_presenter.dart';
import 'package:units/dreams/presenter/dreams_sleep_data_page_presenter.dart';
import 'package:units/dreams/presenter/dreams_sleep_data_presenter.dart';
import 'package:units/dreams/presenter/dreams_sleep_track_presenter.dart';
import 'package:units/dreams/views/behavior_track_views/dreams_track_behavior_component.dart';
import 'dreams/presenter/dreams_extra_info_presenter.dart';
import 'dreams/views/extra_info_views/extra_info_component.dart';
import 'dreams/views/sleep_calc_views/dreams_sleep_calc_component.dart';
import 'dreams/presenter/dreams_sleep_calc_presenter.dart';
import 'dreams/views/sleep_data_page_view/dreams_sleep_data_page_component.dart';
import 'dreams/views/sleep_track_view/dreams_sleep_track_component.dart';
import 'package:units/dreams/presenter/dreams_sleep_diary_presenter.dart';
import 'dreams/views/sleep_diary_view/dreams_sleep_diary_component.dart';
import 'dreams/presenter/dreams_sleep_data_page_presenter.dart';
import'dreams/planetbutton.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp( // Home page start
        home: Builder(
            builder: (context) => Scaffold(
              appBar: AppBar(
                title: Text("Sweet Dreams: " + greeting()),
                  backgroundColor: Colors.black
              ),
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/sunbackground.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
              children: <Widget>[
                /*Padding(
                    padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
                        child: Text("",style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent), textScaleFactor: 2.6, textAlign: TextAlign.center,)
                        ,),*/
                Padding( // Displays the current user logged in to the app
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: Text(" User: " ,//+ FirebaseAuth.instance.currentUser!.displayName!,
                          style: const TextStyle(fontSize: 20, color: Colors.white)
                        ),
                      ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          // First button ( Sleep Calculator)
                       // margin: const EdgeInsets.all(8.0),
                        children:[
                         SizedBox(
                           height: 120,
                        width: 120,
                          child: PlanetButton(
                            text:'Calculator',
                            onPressed: () { // Navigator to Sleep Calculator page
                              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                                return SleepCalcScreen();
                              }));
                            },
                            imageAsset: 'assets/brownheart.png',
                            delay: Duration(milliseconds:500),
                          ),
                       ),
                       SizedBox(
                           height: 100,
                              width: 100,
                              child: PlanetButton(
                                text:'Track Sleep',
                                onPressed: () { // Navigator to Track Sleep screen
                                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                                    return TrackSleepScreen();
                                  }));
                                },
                                imageAsset: 'assets/yellowworld.png',
                                delay: Duration(seconds:1),
                              )
                          ),
                        ]
                      ),
                      Container( // Third button (Track Behaviors)
                          margin: const EdgeInsets.only(top: 20),
                          child: SizedBox(
                            height: 120,
                              width: 120,
                              child: PlanetButton(
                                text:'Behaviors',
                                onPressed: () { // Navigator to Track Behaviors screen
                                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                                    return BehaviorTrackScreen();
                                  }));
                                },
                                imageAsset: 'assets/purple.png',
                                  delay: Duration(milliseconds:500)
                              )
                          )
                      ),
                      Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children:[
                          SizedBox(
                              height: 100,
                              width: 100,
                              child: PlanetButton(
                                text: 'Sleep Diary',
                                onPressed: () { // Navigator to Diary screen
                                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                                    return SleepDiaryScreen();//
                                  }));
                                },
                                  imageAsset: 'assets/earth2.png',
                                delay:Duration(milliseconds:800)
                              )
                          ),
                      SizedBox( // Fifth button (Sleep Data)
                        height: 120,
                              width: 120,
                              child: PlanetButton(
                                text:'Sleep Data',
                                onPressed: () { // Navigator to Sleep Data screen
                                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                                    return SleepDataScreenNav();
                                  }));
                                },
                                imageAsset: 'assets/redmars.png',
                                delay: Duration(milliseconds:500),
                              )
                          )
                  ]
                      ),
                      Container( // Sixth button (Extra Info)
                          margin: const EdgeInsets.only(top: 20, bottom:50),
                          child: SizedBox(
                            height: 130,
                              width: 130,
                              child: PlanetButton(
                                text: 'Extra Info',
                                onPressed: () { // Navigator to Extra Info screen
                                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                                    return ExtraInfoScreen();
                                  }));
                                },
                                  imageAsset: 'assets/blueplanet.png',
                                delay: Duration(seconds:1),
                              )
                          )
                      ),
                      Container( // Logout Button
                        margin: const EdgeInsets.only(top: 100),
                        child: SizedBox(
                          width: 125,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent,
                            ),
                            child: Text('Logout'),
                            onPressed: () {
                              FirebaseAuth.instance.signOut();
                            },
                          ),
                        ),
                      ),
                    ],
                  )
              ),
            ],
            ),
        ),
    ),
        ),
    );
  }
  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning!';
    }
    if (hour < 17) {
      return 'Good Afternoon!';
    }
    return 'Good Evening!';
  }
}


// ignore: slash_for_doc_comments
/*****************************
    Classes used for navigation
 ****************************/

class SleepCalcScreen extends StatefulWidget {
  @override
  _SleepCalcScreen createState() => _SleepCalcScreen();
}

class _SleepCalcScreen extends State<SleepCalcScreen> {
  @override
  Widget build(BuildContext context) {
    return new CalcHomePage(new SleepCalcPresenter(), title: 'Sweet Dreams', key: Key("UNITS"),);
  }
}

class TrackSleepScreen extends StatefulWidget {
  @override
  _TrackSleepScreen createState() => _TrackSleepScreen();
}

class _TrackSleepScreen extends State<TrackSleepScreen> {
  @override
  Widget build(BuildContext context) {
    return new TrackHomePage(new TrackSleepPresenter(), title: 'Sweet Dreams', key: Key("TRACK"),);
  }
}

class BehaviorTrackScreen extends StatefulWidget {
  @override
  _BehaviorTrackScreen createState() => _BehaviorTrackScreen();
}

class _BehaviorTrackScreen extends State<BehaviorTrackScreen> {
  @override
  Widget build(BuildContext context) {
    return new BehaviorHomePage(
      new TrackBehaviorPresenter(), title: 'Sweet Dreams',
      key: Key("BEHAVIOR"),);
  }
}
  class ExtraInfoScreen extends StatefulWidget {
  @override
  _ExtraInfoScreen createState() => _ExtraInfoScreen();
  }

  class _ExtraInfoScreen extends State<ExtraInfoScreen> {
    @override
    Widget build(BuildContext context) {
      return new ExtraInfoHomePage(
        new ExtraInfoPresenter(), title: 'Sweet Dreams',
        key: Key("EXTRAINFO"),);
    }
  }
class SleepDiaryScreen extends StatefulWidget {
  @override
  _SleepDiaryScreen createState() => _SleepDiaryScreen();
}

class _SleepDiaryScreen extends State<SleepDiaryScreen> {
  @override
  Widget build(BuildContext context) {
    return new SleepDiaryHomePage(new SleepDiaryPresenter(), title: 'Sweet Dreams', key: Key("DiarySleep"),);
  }
}

class SleepDataScreenNav extends StatefulWidget {
  @override
  _SleepDataScreenNav createState() => _SleepDataScreenNav();
}

class _SleepDataScreenNav extends State<SleepDataScreenNav> {
  @override
  Widget build(BuildContext context) {
    return new SleepDataPage(new SleepDataPagePresenter(), title: 'Sweet Dreams', key: Key("SleepData"),);
  }
}
