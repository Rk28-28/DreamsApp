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

  var _wakeHourController = TextEditingController();
  var _wakeMinuteController = TextEditingController();
  var _bedHourController = TextEditingController();
  var _bedMinuteController = TextEditingController();
  String _bedHour = "0.0";
  String _bedMinute = "0.0";
  String _wakeMinute = "0.0";
  String _wakeHour = "0.0";
  var _resultString = '';
  var _timeString = '';
  var _message = '';
  var _value = 0;
  var _valueBedTime = -1;
  var _valueWakeTime = -1;
  final FocusNode _bedHourFocus = FocusNode();
  final FocusNode _wakeHourFocus = FocusNode();
  final FocusNode _wakeMinuteFocus = FocusNode();
  final FocusNode _bedMinuteFocus = FocusNode();

  late String average = 'Average Sleep: 0.0';
  double _sleepRating = 3;


  var _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    this.widget.trackPresenter.trackView = this;
  }

  void handleRadioValueChanged(int? value) {
    this.widget.trackPresenter.onOptionChanged(value!, wakeHourString: _wakeHour, wakeMinuteString: _wakeMinute );
  }
  void handleRadioValueChangedBedTime(int? value) {
    this.widget.trackPresenter.onBedTimeOptionChanged(value!);
  }
  void handleRadioValueChangedWakeTime(int? value) {
    this.widget.trackPresenter.onWakeTimeOptionChanged(value!);
  }

  void _submission() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      this.widget.trackPresenter.onSubmitClicked(_bedHour, _bedMinute, _wakeMinute, _wakeHour, _sleepRating);
    }
  }




    @override
  void updateResultValue(String resultValue){
    setState(() {
      _resultString = resultValue;
    });
  }
  @override
  void updateTimeString(String timeString){
    setState(() {
      _timeString = timeString;
    });
  }
  @override
  void updateMessage(String message){
    setState(() {
      _message = message;
    });
  }
  @override
  void updateWakeMinute({required String wakeMinute}){
    setState(() {
      // ignore: unnecessary_null_comparison
      _wakeMinuteController.text = wakeMinute != null?wakeMinute:'';
    });
  }
  @override
  void updateWakeHour({required String wakeHour}){
    setState(() {
      // ignore: unnecessary_null_comparison
      _wakeHourController.text = wakeHour != null?wakeHour:'';
    });
  }
  @override
  void updateBedHour({required String bedHour}) {
    setState(() {
      _bedHourController.text = bedHour != null ? bedHour : '';
    });
  }
  @override
  void updateBedMinute({required String bedMinute}) {
    setState(() {
      _bedMinuteController.text = bedMinute != null ? bedMinute : '';
    });
  }
  @override
  void updateUnit(int value){
    setState(() {
      _value = value;
    });
  }
  @override
  void updateBedTimeUnit(int value){
    setState(() {
      _valueBedTime = value;
    });
  }
  @override
  void updateWakeTimeUnit(int value){
    setState(() {
      _valueWakeTime = value;
    });
  }

  @override
  Widget build(BuildContext context) {

    var _unitViewBedTime = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Radio<int>(
          activeColor: Colors.blueAccent.shade700,
          value: 0, groupValue: _valueBedTime, onChanged: handleRadioValueChangedBedTime,
        ),
        Text(
          'AM',
          style: TextStyle(color: Colors.blueAccent.shade700),
        ),
        Radio<int>(
          activeColor: Colors.blueAccent.shade700,
          value: 1, groupValue: _valueBedTime, onChanged: handleRadioValueChangedBedTime,
        ),
        Text(
          'PM',
          style: TextStyle(color: Colors.blueAccent.shade700),
        ),
      ],
    );

    var _unitViewWakeTime = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Radio<int>(
          activeColor: Colors.blueAccent.shade700,
          value: 0, groupValue: _valueWakeTime, onChanged: handleRadioValueChangedWakeTime,
        ),
        Text(
          'AM',
          style: TextStyle(color: Colors.blueAccent.shade700),
        ),
        Radio<int>(
          activeColor: Colors.blueAccent.shade700,
          value: 1, groupValue: _valueWakeTime, onChanged: handleRadioValueChangedWakeTime,
        ),
        Text(
          'PM',
          style: TextStyle(color: Colors.blueAccent.shade700),
        ),
      ],
    );

    var _mainPartView = Container(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 6.0),
                child: Text("I went to bed at:",style: const TextStyle(fontWeight: FontWeight.bold), textScaleFactor: 1.5,)
                ,),
              //_unitView,
              Row(
                children: <Widget>[
                  Expanded(
                    child: bedHourFormField(context),
                  ),
                  Expanded(
                    child: bedMinFormField(context),
                  )
                ],
              ),
              _unitViewBedTime,
              Padding(
                padding: EdgeInsets.only(top: 6.0),
                child: Text("I woke up at:",style: const TextStyle(fontWeight: FontWeight.bold), textScaleFactor: 1.5,)
                ,),
              Row(
                children: <Widget>[
                  Expanded(
                    child: wakeHourFormField(context),
                  ),
                  Expanded(
                    child: wakeMinuteFormField(),
                  ),
                ],
              ),
              _unitViewWakeTime,
            ],
          ),
        ),
      ),
    );


    return Scaffold(
        appBar: AppBar(
          title: Text('Sleep Tracker'),
          centerTitle: true,
          backgroundColor: Colors.blueAccent.shade700,
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.all(4.0)),
            _mainPartView,
            /*Padding(padding: EdgeInsets.all(4.0)),
            _resultView,*/
          Text(
            'Rate your quality of sleep',
            style: TextStyle(color: Colors.blueAccent.shade700, fontSize: 16.0),
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
              padding: EdgeInsets.only(top: 6.0),
              child: submitButton()
              ,),

          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                return SleepDataScreen();
              }));
            },
            child: Text('Next: Enter sleep data'),
          ),
          ],
        ),
    );
  }


  ElevatedButton submitButton() {
    return ElevatedButton(
      onPressed: _submission,
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueAccent.shade700,
          textStyle: TextStyle(color: Colors.white70)
      ),
      child: Text(
        'Submit',
        style: TextStyle(fontSize: 16.0),
      ),
    );
  }

  TextFormField wakeMinuteFormField() {
    return TextFormField(
      controller: _wakeMinuteController,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.done,
      focusNode: _wakeMinuteFocus,
      onFieldSubmitted: (value){
        _wakeMinuteFocus.unfocus();
      },
      validator: (value) {
        if (value!.length == 0 || (double.parse(value) < 0 || double.parse(value) > 59)) {
          return ('Minute between 0 - 59');
        }
      },
      onSaved: (value) {
        _wakeMinute = value!;
      },
      decoration: InputDecoration(
          hintText: 'e.g.) 40',
          labelText: 'Minute',
          icon: Icon(Icons.assessment),
          fillColor: Colors.white
      ),
    );
  }

  TextFormField wakeHourFormField(BuildContext context) {
    return TextFormField(
      controller: _wakeHourController,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      focusNode: _wakeHourFocus,
      onFieldSubmitted: (term) {
        _fieldFocusChange(context, _wakeHourFocus, _wakeMinuteFocus);
      },
      validator: (value) {
        if (value!.length == 0 || (double.parse(value) < 1 || double.parse(value) > 12)) {
          return ('Hour between 1 - 12');
        }
      },
      onSaved: (value) {
        _wakeHour = value!;
      },
      decoration: InputDecoration(
        hintText: "e.g.) 7",
        labelText: "Hour",
        icon: Icon(Icons.assessment),
        fillColor: Colors.white,
      ),
    );
  }

  TextFormField bedHourFormField(BuildContext context) {
    return TextFormField(
      controller: _bedHourController,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      focusNode: _bedHourFocus,
      onFieldSubmitted: (term){
        _fieldFocusChange(context, _bedHourFocus, _bedMinuteFocus);
      },
      validator: (value) {
        if (value!.length == 0 || (double.parse(value) < 1 || double.parse(value) > 12)) {
          return ('Hour between 1 - 12');
        }
      },
      onSaved: (value) {
        _bedHour = value!;
      },
      decoration: InputDecoration(
        hintText: 'e.g.) 6',
        labelText: 'Hour',
        icon: Icon(Icons.assessment),
        fillColor: Colors.white,
      ),
    );
  }

  TextFormField bedMinFormField(BuildContext context) {
    return TextFormField(
      controller: _bedMinuteController,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      focusNode: _bedMinuteFocus,
      onFieldSubmitted: (term){
        _fieldFocusChange(context, _bedMinuteFocus, _wakeHourFocus);
      },
      validator: (value) {
        if (value!.length == 0 || (double.parse(value) < 0 || double.parse(value) > 59)) {
          return ('Minute between 0 - 59');
        }
      },
      onSaved: (value) {
        _bedMinute = value!;
      },
      decoration: InputDecoration(
        hintText: 'e.g.) 30',
        labelText: 'Minute',
        icon: Icon(Icons.assessment),
        fillColor: Colors.white,
      ),
    );
  }

  _fieldFocusChange(BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
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
