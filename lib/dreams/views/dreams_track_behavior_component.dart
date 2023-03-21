import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:units/dreams/presenter/dreams_behavior_track_presenter.dart';
import 'dreams_behavior_view.dart';
import 'dreams_track_view.dart';
class BehaviorHomePage extends StatefulWidget{
  final BEHAVIORPresenter behaviorPresenter;

  BehaviorHomePage(this.behaviorPresenter, {required Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _BehaviorHomePageState createState() => _BehaviorHomePageState();
}

double sliderValue = 1; //To be used with the stress slider

class _BehaviorHomePageState extends State<BehaviorHomePage> implements BEHAVIORView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Behavior Tracker'),
        // TODO: Implement behavior track home page
      ),
      body: Column( //Outer column
        children: <Widget>[

          Column( //First inner column
            children: [

              const Padding(
                padding: EdgeInsets.fromLTRB(16, 32, 16, 16),
                child: Text('How much caffeine did you consume today?',
                    style: TextStyle(fontSize: 18.0)
                ),
              ),

              const Padding(
                padding: EdgeInsets.fromLTRB(16, 16, 16, 32),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter caffeine consumed (in mL)',
                  ),
                ),
              )
            ],

          ),

          Column( //Second inner column
              children: [

                const Padding(
                  padding: EdgeInsets.fromLTRB(16, 32, 16, 16),
                  child: Text('How many calories did you consume today?',
                      style: TextStyle(fontSize: 18.0)
                  ),
                ),

                Padding(
                  padding: EdgeInsets.fromLTRB(16, 16, 16, 32),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter calories consumed',
                    ),
                  ),
                ),
              ] //children
          ),

          Column( //Third inner column
            children: [
              const Padding(
                  padding: EdgeInsets.fromLTRB(16, 32, 16, 16),
                  child: Text('How stressed were you today?',
                    style: TextStyle(fontSize: 18.0),)
              ),

              Slider(
                value: sliderValue,
                min: 1,
                max: 5,
                divisions: 4,
                label: sliderValue.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    sliderValue = value;
                  });
                },
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16, 8, 32, 8),
                child: Row( //Contains text for slider
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Little stress'),
                    Text('Lots of stress')
                  ],
                ),
              ),
            ], //children
          ),
          Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Enter', style: TextStyle(fontSize: 18.0))
                ),
              )
          ),
        ],
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
