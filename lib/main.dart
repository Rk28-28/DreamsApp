import 'package:flutter/material.dart';
import 'package:units/dreams/presenter/dreams_behavior_track_presenter.dart';
import 'package:units/dreams/presenter/dreams_sleep_track_presenter.dart';
import 'package:units/dreams/views/dreams_track_behavior_component.dart';
import 'dreams/views/dreams_sleep_calc_component.dart';
import 'dreams/presenter/dreams_sleep_calc_presenter.dart';
import 'dreams/views/dreams_sleep_track_component.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text("Sweet Dreams"),
          ),
          body: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: Text("Welcome to the sweet dreams app!",style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent), textScaleFactor: 2.6, textAlign: TextAlign.center,)
                  ,),
                Container(
                    margin: const EdgeInsets.only(top: 30),
                    child: SizedBox(
                        width: 150,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blueAccent,
                          ),
                          child: Text('Sleep Calculator'),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                              return SleepCalcScreen();
                            }));
                          },
                        ),
                    ),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: SizedBox(
                        width: 150,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blueAccent,
                          ),
                          child: Text('Track Sleep'),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                              return TrackSleepScreen();
                            }));
                          },
                        )
                    )
                ),
                Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: SizedBox(
                      width: 150,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blueAccent,
                          ),
                          child: Text('Track Behaviors'),
                          onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                                return BehaviorTrackScreen();
                              }));
                          },
                        )
                    )
                ),
              ],
            )
          ),
        )
      )
    );
  }
}

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
    return new BehaviorHomePage(new TrackBehaviorPresenter(), title: 'Sweet Dreams', key: Key("BEHAVIOR"),);
  }
}
