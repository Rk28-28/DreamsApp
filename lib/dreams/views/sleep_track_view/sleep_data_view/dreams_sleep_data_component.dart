import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:units/dreams/presenter/dreams_sleep_data_presenter.dart';
import 'dreams_sleep_data_view.dart';

class SleepDataHomePage extends StatefulWidget{
  final SleepDataPresenter sleepdataPresenter;

  SleepDataHomePage(this.sleepdataPresenter, {required Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _SleepDataHomePageState createState() => _SleepDataHomePageState();
}

void handleRadioValueChanged(int? value) {

}

class _SleepDataHomePageState extends State<SleepDataHomePage> implements SLEEPDATAView {
  int _firstGroupValue = -1;
  int _secondGroupValue = -1;
  final myController = TextEditingController();

  var _formKey = GlobalKey<FormState>();


  void _submission() {
      this.widget.sleepdataPresenter.onSubmitClicked(_firstGroupValue, _secondGroupValue, myController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sleep Data'),
            backgroundColor: Colors.black
          // TODO: Implement SleepData home page
        ),
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
            children: <Widget>[

              Column( //First inner column
                  children: [

                    const Padding(
                      padding: EdgeInsets.fromLTRB(16, 32, 16, 16),
                      child: Text('Did you wake up during the night?',
                          style: TextStyle(fontSize: 18, color: Colors.white)
                      ),
                    ),
                    Row (
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Radio<int>(
                          activeColor: Colors.white,
                          fillColor: MaterialStateColor.resolveWith((states) => Colors.white),
                          //value: 0, groupValue: 0, onChanged: handleRadioValueChanged,
                          value: 0, groupValue: _firstGroupValue, onChanged: (newValue) => setState(() => _firstGroupValue = newValue!),
                        ),
                        Text(
                          'Yes',
                          style: TextStyle(color: Colors.white),
                        ),
                        Radio<int>(
                          activeColor: Colors.white,
                          fillColor: MaterialStateColor.resolveWith((states) => Colors.white),
                          //value: 1, groupValue: 0, onChanged: handleRadioValueChanged,
                          value: 1, groupValue: _firstGroupValue, onChanged: (newValue) => setState(() => _firstGroupValue = newValue!),
                        ),
                        Text(
                          'No',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    )
                  ]
              ),

              Column( //Second inner column
                  children: [

                    const Padding(
                      padding: EdgeInsets.fromLTRB(16, 32, 16, 16),
                      child: Text('Did you have a dream or a nightmare?',
                      style: TextStyle(fontSize: 18.0, color: Colors.white)
                      ),
                    ),
                    Row (
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Radio<int>(
                          activeColor: Colors.white,
                          fillColor: MaterialStateColor.resolveWith((states) => Colors.white),
                          //value: 0, groupValue: 0, onChanged: handleRadioValueChanged,
                          value: 2, groupValue: _secondGroupValue, onChanged: (newValue) => setState(() => _secondGroupValue = newValue!),
                        ),
                        Text(
                          'Dream',
                          style: TextStyle(color: Colors.white),
                        ),
                        Radio<int>(
                          activeColor: Colors.white,
                          fillColor: MaterialStateColor.resolveWith((states) => Colors.white),
                          //value: 1, groupValue: 0, onChanged: handleRadioValueChanged,
                          value: 3, groupValue: _secondGroupValue, onChanged: (newValue) => setState(() => _secondGroupValue = newValue!),
                        ),
                        Text(
                          'Nightmare',
                          style: TextStyle(color: Colors.white),
                        ),
                        Radio<int>(
                          activeColor: Colors.white,
                          fillColor: MaterialStateColor.resolveWith((states) => Colors.white),
                          //value: 2, groupValue: 0, onChanged: handleRadioValueChanged,
                          value: 4, groupValue: _secondGroupValue, onChanged: (newValue) => setState(() => _secondGroupValue = newValue!),
                        ),
                        Text(
                          'Neither',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    )
                  ]
              ),

              Column(
                children: <Widget>[
                  TextField(
                    controller: myController,
                    keyboardType: TextInputType.multiline,
                    minLines: 1,
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: 'Enter a short description',
                      hintStyle: TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.3),

                    ),
                  )
                ]
              ),

              Column(
                children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  child: SizedBox(
                    width: 150,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blueAccent,
                      ),
                      onPressed: () {
                        _submission();
                      },
                      child: Text('Submit'),
                      //onPressed

                    ),
                  )
                )
                ]
              )


            ]
        )
        )
    );

  }

  @override
  void initState() {
    super.initState();
    this.widget.sleepdataPresenter.SleepDataView = this;
  }


}
