import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:units/dreams/presenter/dreams_sleep_data_page_presenter.dart';
import 'package:units/dreams/views/sleep_track_view/dreams_sleep_track_view.dart';
import '../../presenter/dreams_sleep_data_presenter.dart';
import '../../presenter/dreams_sleep_track_presenter.dart';
import 'sleep_data_view/dreams_sleep_data_component.dart';

class TrackHomePage extends StatefulWidget {
  final TRACKPresenter trackPresenter;

  TrackHomePage(this.trackPresenter, {required Key? key, required this.title})
      : super(key: key);
  final String title;

  @override
  _TrackHomePageState createState() => _TrackHomePageState();
}

class _TrackHomePageState extends State<TrackHomePage> implements TRACKView {
  var _wakeHourController = TextEditingController();
  var _wakeMinuteController = TextEditingController();
  var _bedHourController = TextEditingController();
  var _bedMinuteController = TextEditingController();
  int _bedHour = 0;
  int _bedMinute = 0;
  int _wakeMinute = 0;
  int _wakeHour = 0;
  var _bedAmPm = 0;
  var _wakeAmPm = 0;
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

  void _submission() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      this.widget.trackPresenter.onSubmitClicked(_bedHour, _bedMinute, _bedAmPm,
          _wakeHour, _wakeMinute, _wakeAmPm, _sleepRating);
    }
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content:
            Text('Processing Data', style: TextStyle(color: Colors.white))));

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Done!', style: TextStyle(color: Colors.white))));
  }

  @override
  Widget build(BuildContext context) {
    var _unitViewBedTime = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Radio<int>(
          activeColor: Colors.white,
          fillColor: MaterialStateColor.resolveWith((states) => Colors.white),
          value: 0,
          groupValue: _bedAmPm,
          onChanged: (value) {
            setState(() {
              _bedAmPm = value!;
            });
          },
        ),
        Text(
          'AM',
          style: TextStyle(color: Colors.white),
        ),
        Radio<int>(
          activeColor: Colors.white,
          fillColor: MaterialStateColor.resolveWith((states) => Colors.white),
          value: 1,
          groupValue: _bedAmPm,
          onChanged: (value) {
            setState(() {
              _bedAmPm = value!;
            });
          },
        ),
        Text(
          'PM',
          style: TextStyle(color: Colors.white),
        ),
      ],
    );

    var _unitViewWakeTime = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Radio<int>(
          activeColor: Colors.white,
          fillColor: MaterialStateColor.resolveWith((states) => Colors.white),
          value: 0,
          groupValue: _wakeAmPm,
          onChanged: (value) {
            setState(() {
              _wakeAmPm = value!;
            });
          },
        ),
        Text(
          'AM',
          style: TextStyle(color: Colors.white),
        ),
        Radio<int>(
          activeColor: Colors.white,
          fillColor: MaterialStateColor.resolveWith((states) => Colors.white),
          value: 1,
          groupValue: _wakeAmPm,
          onChanged: (value) {
            setState(() {
              _wakeAmPm = value!;
            });
          },
        ),
        Text(
          'PM',
          style: TextStyle(color: Colors.white),
        ),
      ],
    );

    var _mainPartView = Container(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 6.0),
                  child: Text(
                    "I went to bed at:",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                    textScaleFactor: 1.5,
                  ),
                ),
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
                  child: Text(
                    "I woke up at:",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                    textScaleFactor: 1.5,
                  ),
                ),
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
      ),
    );

    return Scaffold(
      appBar: AppBar(
          title: Text('Sleep Tracker'),
          centerTitle: true,
          backgroundColor: Colors.black),
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/backgrounds/yellowplanetbg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top :4.0, bottom: 4.0)),
            _mainPartView,
            /*Padding(padding: EdgeInsets.all(4.0)),
            _resultView,*/
            Text(
              'Rate your quality of sleep',
              style: TextStyle(color: Colors.white, fontSize: 16.0),
            ),

            // Slider for rating quality of sleep
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Bad (1)', style: TextStyle(color: Colors.white)),
                      Text('Good (5)', style: TextStyle(color: Colors.white)),
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
              child: submitButton(),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return SleepDataScreen();
                }));
              },
              child: Text('Next: Enter sleep data'),
            ),
          ],
        ),
      ),
    );
  }

  ElevatedButton submitButton() {
    return ElevatedButton(
      onPressed: _submission,
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueAccent.shade700,
          textStyle: TextStyle(color: Colors.white70)),
      child: Text(
        'Submit',
        style: TextStyle(fontSize: 16.0),
      ),
    );
  }

  TextFormField wakeMinuteFormField() {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      controller: _wakeMinuteController,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.done,
      focusNode: _wakeMinuteFocus,
      onFieldSubmitted: (value) {
        _wakeMinuteFocus.unfocus();
      },
      validator: (value) {
        if (value!.length == 0 ||
            (double.parse(value) < 0 || double.parse(value) > 59)) {
          return ('Minute between 0 - 59');
        }
      },
      onSaved: (value) {
        _wakeMinute = int.parse(value!);
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white.withOpacity(0.3),
        border: OutlineInputBorder(),
        hintText: 'e.g.) 40',
        hintStyle: TextStyle(color: Colors.white),
        labelText: 'Minute',
        labelStyle: TextStyle(color: Colors.white),
        icon: Icon(Icons.assessment),
      ),
    );
  }

  TextFormField wakeHourFormField(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      controller: _wakeHourController,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      focusNode: _wakeHourFocus,
      onFieldSubmitted: (term) {
        _fieldFocusChange(context, _wakeHourFocus, _wakeMinuteFocus);
      },
      validator: (value) {
        if (value!.length == 0 ||
            (double.parse(value) < 1 || double.parse(value) > 12)) {
          return ('Hour between 1 - 12');
        }
      },
      onSaved: (value) {
        _wakeHour = int.parse(value!);
      },
      decoration: InputDecoration(
        hintText: "e.g.) 7",
        hintStyle: TextStyle(color: Colors.white),
        labelText: "Hour",
        labelStyle: TextStyle(color: Colors.white),
        icon: Icon(Icons.assessment),
        filled: true,
        fillColor: Colors.white.withOpacity(0.3),
      ),
    );
  }

  TextFormField bedHourFormField(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      controller: _bedHourController,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      focusNode: _bedHourFocus,
      onFieldSubmitted: (term) {
        _fieldFocusChange(context, _bedHourFocus, _bedMinuteFocus);
      },
      validator: (value) {
        if (value!.length == 0 ||
            (double.parse(value) < 1 || double.parse(value) > 12)) {
          return ('Hour between 1 - 12');
        }
      },
      onSaved: (value) {
        _bedHour = int.parse(value!);
      },
      decoration: InputDecoration(
        hintText: 'e.g.) 6',
        hintStyle: TextStyle(color: Colors.white),
        labelText: 'Hour',
        labelStyle: TextStyle(color: Colors.white),
        icon: Icon(Icons.assessment),
        filled: true,
        fillColor: Colors.white.withOpacity(0.3),
      ),
    );
  }

  TextFormField bedMinFormField(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      controller: _bedMinuteController,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      focusNode: _bedMinuteFocus,
      onFieldSubmitted: (term) {
        _fieldFocusChange(context, _bedMinuteFocus, _wakeHourFocus);
      },
      validator: (value) {
        if (value!.length == 0 ||
            (double.parse(value) < 0 || double.parse(value) > 59)) {
          return ('Minute between 0 - 59');
        }
      },
      onSaved: (value) {
        _bedMinute = int.parse(value!);
      },
      decoration: InputDecoration(
        hintText: 'e.g.) 30',
        hintStyle: TextStyle(color: Colors.white),
        labelText: 'Minute',
        labelStyle: TextStyle(color: Colors.white),
        icon: Icon(Icons.assessment),
        filled: true,
        fillColor: Colors.white.withOpacity(0.3),
      ),
    );
  }

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
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
      new SleepDataPresenter(),
      title: 'Sweet Dreams',
      key: Key("SleepData"),
    );
  }
}
