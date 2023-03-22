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

  double sliderValue = 1; //To be used with the stress slider
  TextEditingController caffeineController = new TextEditingController(); //To be used to grab input from caffeine text field
  TextEditingController calorieController = new TextEditingController(); //To be used to grab input from caffeine text field
  final regex = RegExp(r"^[0-9]+$"); //Regex for checking validation of input


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
                padding: EdgeInsets.fromLTRB(16,32,16,16),
                child: Text('How much caffeine did you consume today?',
                    style: TextStyle(fontSize: 18.0)
                ),
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(16,16,16,32),
                child: TextFormField(
                    controller: caffeineController,
                    validator: (value) {

                    },
                    decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter caffeine consumed (in mL)',

                  ),

                ),
              )],

              ),

              Column( //Second inner column
                children: [

              const Padding(
                padding: EdgeInsets.fromLTRB(16,32,16,16),
                child: Text('How many calories did you consume today?',
                style: TextStyle(fontSize: 18.0)
                ),
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(16,16,16,32),
                child: TextFormField(
                  controller: calorieController,
                  validator: (value) {

                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter calories consumed',
                  ),
                ),
                ),
              ]    //children
             ),

              Column(//Third inner column
                children: [
                  const Padding(
                    padding:EdgeInsets.fromLTRB(16,32,16,16),
                    child: Text('How stressed were you today?', style: TextStyle(fontSize: 18.0),)
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
                    padding:EdgeInsets.fromLTRB(16,8,32,8),
                  child: Row( //Contains text for slider
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Little stress'),
                      Text('Lots of stress')
                    ],
                  ),
                  ),
                ],//children
              ),

              Padding(
                padding:EdgeInsets.fromLTRB(16,8,32,8),
                child: Text('',
                  style: TextStyle(fontWeight: FontWeight.bold,
                      color: Colors.red.withOpacity(1.0)),
                ),

              ),
              Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                        onPressed: () {
                          


                        }, child: const Text('Enter', style: TextStyle(fontSize: 18.0))
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