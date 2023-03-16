import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:units/dreams/views/dreams_track_view.dart';
import '../presenter/dreams_sleep_track_presenter.dart';

class TrackHomePage extends StatefulWidget{
  final TRACKPresenter trackPresenter;

  TrackHomePage(this.trackPresenter, {required Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _TrackHomePageState createState() => _TrackHomePageState();
}

class _TrackHomePageState extends State<TrackHomePage> implements TRACKView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sleep Tracker'),
      )
    );
  }

  @override
  void initState() {
    super.initState();
    this.widget.trackPresenter.trackView = this;
  }

  @override
  set trackView(TRACKView value) {
    // TODO: implement trackView
  }
}