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

class _BehaviorHomePageState extends State<BehaviorHomePage> implements BEHAVIORView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Behavior Tracker'),
          // TODO: Implement behavior track home page
        ),
        body: Center(
          child: Column( //Outer column
            children: <Widget>[
              Column( //First inner column
                children: [

              const Padding(
                padding: EdgeInsets.fromLTRB(16,32,16,16),
            //horizontal: 8, vertical: 16),
                child: Text('How much caffeine did you consume today?',
                    style: TextStyle(fontSize: 18.0)
                ),
              ),

              const Padding(
                padding: EdgeInsets.fromLTRB(16,16,16,32),
                //EdgeInsets.symmetric(horizontal: 16 , vertical: 16),
                child: TextField(
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
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: Text('How stressed were you today?'),
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

                ],//children

              ),
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