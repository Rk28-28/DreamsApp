import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:units/dreams/views/sleep_track_view/dreams_sleep_track_view.dart';
import '../../presenter/dreams_sleep_data_presenter.dart';
import '../../presenter/dreams_sleep_track_presenter.dart';
import 'sleep_data_view/dreams_sleep_data_component.dart';


class TrackHomePage extends StatefulWidget{
  final TRACKPresenter trackPresenter;

  TrackHomePage(this.trackPresenter, {required Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _TrackHomePageState createState() => _TrackHomePageState();
}

class _TrackHomePageState extends State<TrackHomePage> implements TRACKView {
  // Controllers for the text field widgets
  final TextEditingController _sleepTimeController = TextEditingController();
  final TextEditingController _wakeTimeController = TextEditingController();

  String? _timeWentToBed;
  String? _timeWokeUp;
  final _formKey = GlobalKey<FormState>();
  late String average = 'Average Sleep: 0.0';

  // Rating of quality of sleep
  double _sleepRating = 3;


  // Regular expression for validating time input in format HH:MM am/pm
  String? validateTime(String? input) {
    final validTime = RegExp(r'^\d{1,2}:\d{2} (am|pm)$');
    if (!validTime.hasMatch(input ?? '')) {
      return 'Please enter a valid time (e.g. 3:30 pm)';
    }
    return null;
  }
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save(); // Save the form values
      setState(() {
        average = this.widget.trackPresenter.onSubmitClicked(_timeWentToBed!, _timeWokeUp!, _sleepRating)!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sleep Tracker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 16.0), // add 16 pixels of spacing
            // Row for inputting sleep and wake times
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Text field for inputting sleep time
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _sleepTimeController,
                      decoration: InputDecoration(
                        labelText: 'Time Went To Bed',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.datetime,
                      inputFormatters: [],
                      validator: validateTime,
                      onSaved: (String? value) {
                        _timeWentToBed = value ?? '';
                      },
                    ),
                  ),
                ),

                // Text field for inputting wake time
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _wakeTimeController,
                      decoration: InputDecoration(
                        labelText: 'Time You Woke Up',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.datetime,
                      inputFormatters: [],
                      validator: validateTime,
                      onSaved: (String? value) {
                        _timeWokeUp = value ?? '';
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0), // add 16 pixels of spacing
            // Button to enter sleep data
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                  return SleepDataScreen();
                }));
              },
              child: Text('Enter sleep data'),
            ),
            SizedBox(height: 32.0), // add 16 pixels of spacing
            Text(
              'Rate your quality of sleep',
              style: TextStyle(color: Colors.blueAccent.shade700),
            ),
            // Slider for rating quality of sleep
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Bad (1)'),
                  Text('Good (5)'),
                ],
              ),
               Slider(
                value: _sleepRating,
                min: 1,
                max: 5,
                divisions: 4,
                onChanged: (double value) {
                  setState(() {
                    _sleepRating = value;
                  });
                },
                label: '$_sleepRating',
              ),
              ],
            ),
          ),
        Padding(
          padding: const EdgeInsets.all(32.0),
            // Text widget to display average sleep
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Text(
                    average,
                  //_calculateAverageSleep(), need to create this function
                  //style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _submitForm();
                setState(() {});
                },
              child: Text('Submit'),
            ),
        ],
      ),
    )
    );
  }


  @override
  void initState() {
    super.initState();
    this.widget.trackPresenter.trackView = this;
  }

  set trackView(TRACKView value) {
  }
}

class SleepDataScreen extends StatefulWidget {
  @override
  _SleepDataScreen createState() => _SleepDataScreen();
}

class _SleepDataScreen extends State<SleepDataScreen> {
  @override
  Widget build(BuildContext context) {
    return new SleepDataHomePage(
      new SleepDataPresenter(), title: 'Sweet Dreams', key: Key("SleepData"),);
  }
}