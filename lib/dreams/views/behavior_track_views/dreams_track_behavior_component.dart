import 'package:flutter/material.dart';
import 'package:units/dreams/presenter/dreams_behavior_track_presenter.dart';
import 'dreams_behavior_view.dart';
import 'package:units/dreams/viewmodel/dreams_track_behavior_viewmodel.dart';


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
  final _formKey = GlobalKey<FormState>(); //Used to check validation of input
  //final calorieKey = GlobalKey<FormState>();

class _BehaviorHomePageState extends State<BehaviorHomePage> implements BEHAVIORView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Behavior Tracker'),
            backgroundColor: Colors.black
        ),
          body: Container(
            width: double.infinity,
            height: double.infinity,
          decoration: BoxDecoration(
          image: DecorationImage(
          image: AssetImage('assets/backgrounds/purpleplanetbg.png'),
          fit: BoxFit.cover,
          ),
          ),

          child:Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form( //form
               key: _formKey,
    child: SingleChildScrollView(
    child: Column(
      mainAxisSize: MainAxisSize.min,
    children: <Widget>[
    Flexible(
    child: Column( //First inner column
                children: [

              const Padding(
                padding: EdgeInsets.fromLTRB(16,32,16,16),
                child: Text('How much caffeine did you consume today?',
                    style: TextStyle(fontSize: 18.0, color: Colors.white)

                ),
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(16,16,16,32),
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                    controller: caffeineController,
                    validator: (value) {
                      if(value == null || value.isEmpty|| !regex.hasMatch(value))
                        return "Error: Input must be digits only";

                      return null;
                    },
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.3),
                       border: OutlineInputBorder(),
                       hintText: 'Enter caffeine consumed (in mg)',
                      hintStyle: TextStyle(color: Colors.white),
                      labelStyle: TextStyle(color: Colors.white),

                  ),

                ),
              )],

              ),
    ),
              Flexible(
                child:
              Column( //Second inner column
                children: [

              const Padding(
                padding: EdgeInsets.fromLTRB(16,32,16,16),
                child: Text('How many calories did you consume today?',
                style: TextStyle(fontSize: 18.0, color: Colors.white),

                ),
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(16,16,16,32),
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: calorieController,

                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.3),
                    border: OutlineInputBorder(),
                    labelText: 'Enter calories consumed',
                    labelStyle: TextStyle(color: Colors.white)
                  ),
                  validator: (value) {
                    if(value == null || value.isEmpty || !regex.hasMatch(value)) {
                      return "Error: Input must be digits only";
                    }
                    return null;
                  },
                ),
                ),
              ]    //children
             ),
              ),
      Flexible(
          child:
              Column(//Third inner column
                children: [
                  const Padding(
                    padding:EdgeInsets.fromLTRB(16,32,16,16),
                    child: Text('How stressed were you today?', style: TextStyle(fontSize: 18.0,
                        color: Colors.white),)
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
                      Text('Little stress', style: TextStyle(color: Colors.white)),

                      Text('Lots of stress', style: TextStyle(color: Colors.white))
                    ],
                  ),
                  ),
                ],//children
              ),
      ),
              Padding(
                padding:EdgeInsets.fromLTRB(16,8,32,8),
                child: Text('',
                  style: TextStyle(fontWeight: FontWeight.bold,
                      color: Colors.red.withOpacity(1.0)),
                ),

              ),
              Flexible(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                        onPressed: () {
                          if(_formKey.currentState!.validate())
                            {
                              this.widget.behaviorPresenter.onSubmitClicked(calorieController.text.toString(), caffeineController.text.toString(),sliderValue);

                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Processing Data', style: TextStyle(color: Colors.white))));

                                }

                        }, child: const Text('Enter', style: TextStyle(fontSize: 18.0))
                    ),
                  )
              ),

                    ],
              ),
    ),
            ),
    ),
          )
          );



  }
  BehaviorTrackViewModel viewModel = new BehaviorTrackViewModel();
  @override
  void initState() {
    super.initState();
    this.widget.behaviorPresenter.trackView = this;
  }

  set behaviorView(BEHAVIORView value) {
  }
}