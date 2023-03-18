import 'package:flutter/material.dart';
import 'package:units/dreams/presenter/dreams_behavior_track_presenter.dart';
import 'dreams_behavior_view.dart';

class BehaviorHomePage extends StatefulWidget{
  final BEHAVIORPresenter behaviorPresenter;

  BehaviorHomePage(this.behaviorPresenter, {required Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _BehaviorHomePageState createState() => _BehaviorHomePageState();
}

class _BehaviorHomePageState extends State<BehaviorHomePage> implements BEHAVIORView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Behavior Tracker'),
          // TODO: Implement behavior track home page
        ),
        body: Center(
          child: Column(
              children: <Widget>[
                TextButton(onPressed: onPressed, child: child), // Enter Button when pressed should 

              ],
            ),
          ),
    );

  }

  @override
  void initState() {
    super.initState();
    this.widget.behaviorPresenter.trackView = this;
  }

  @override
  set behaviorView(BEHAVIORView value) {
  }
}