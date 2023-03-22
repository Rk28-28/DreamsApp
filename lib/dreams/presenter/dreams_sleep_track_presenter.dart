import 'package:units/dreams/utils/dreams_utils.dart';
import 'package:units/dreams/viewmodel/dreams_track_sleep_viewmodel.dart';
import 'package:units/dreams/views/sleep_track_view/dreams_sleep_track_view.dart';

import '../utils/dreams_constant.dart';

class TRACKPresenter{

  set trackView(TRACKView value){

  }
  void onSubmitClicked(String hourString, String minuteString, String sleepMinuteString, String sleepHourString, double sleepRating){

  }
void onOptionChanged(int value, {required String wakeMinuteString, required String wakeHourString}) {

}
void onBedTimeOptionChanged(int value) {

}
void onWakeTimeOptionChanged(int value) {

  }
set unitsView(TRACKView value){}

void onBedHourSubmitted(String hour){}
void onBedMinuteSubmitted(String minute){}
void onWakeHourSubmitted(String sleepHour){}
void onWakeMinuteSubmitted(String sleepMinute){}
}
class TrackSleepPresenter implements TRACKPresenter {

  @override
  set trackView(TRACKView value) {
    // TODO: implement trackView
  }


  SleepTrackViewModel _viewModel = SleepTrackViewModel();
  TRACKView _view = TRACKView();

  TrackSleepPresenter() {
    this._viewModel = _viewModel;
    _loadUnit();
  }

  void _loadUnit() async {
    _viewModel.value = await loadValue();
    _viewModel.valueBedTime = await loadValue();
    _viewModel.valueWakeTime = await loadValue();
    _view.updateUnit(_viewModel.value);
    _view.updateBedTimeUnit(_viewModel.valueBedTime);
    _view.updateWakeTimeUnit(_viewModel.valueWakeTime);
  }

  @override
  set unitsView(TRACKView value) {
    _view = value;
    _view.updateUnit(_viewModel.value);
    _view.updateBedTimeUnit(_viewModel.valueBedTime);
    _view.updateWakeTimeUnit(_viewModel.valueWakeTime);
  }

  @override
  void onSubmitClicked(String hourString, String minuteString,
      String sleepMinuteString, String sleepHourString, double sleepRating) {
    var bedHour = 0.0;
    var bedMinute = 0.0;
    var wakeHour = 0.0;
    var wakeMinute = 0.0;

    try {
      bedHour = double.parse(hourString);
    } catch (e) {

    }
    try {
      bedMinute = double.parse(minuteString);
    } catch (e) {

    }
    try {
      wakeHour = double.parse(sleepHourString);
    } catch (e) {

    }
    try {
       wakeMinute = double.parse(sleepMinuteString);
    } catch (e) {

    }

    List temp = new List.filled(3, null, growable: false);
    _viewModel.bedHour = bedHour;
    _viewModel.bedMinute = bedMinute;
    _viewModel.wakeHour = wakeHour;
    _viewModel.wakeMinute = wakeMinute;
    _viewModel.sleepRating = sleepRating;
// TODO: change calculator function so it sends things to databases????
    temp = calculator(bedHour, bedMinute, wakeHour, wakeMinute, _viewModel.unitType,
        _viewModel.unitTypeTime);
    //  temp returns a List of the time, AM or PM, and WAKE or BED.
    //  The time that is returned is in the format of a double ex) 12.30 is 12:30.

    _viewModel.units = temp[0];
    UnitType tempTime = temp[1];
    UnitType tempMessage = temp[2];

    if (tempTime == UnitType.AM) {
      _viewModel.timeType = "AM";
    } else if (tempTime == UnitType.PM) {
      _viewModel.timeType = "PM";
    }

    if (tempMessage == UnitType.BED) {
      _viewModel.message = "You should wake up at";
    } else if (tempMessage == UnitType.WAKE) {
      _viewModel.message = "You should go to bed at";
    }
    _view.updateMessage(_viewModel.message);
    _view.updateTimeString(_viewModel.timeType);
    _view.updateResultValue(_viewModel.resultInString);
  }

  @override
  void onOptionChanged(int value,
      {required String wakeMinuteString, required String wakeHourString}) {
    if (value != _viewModel.value) {
      _viewModel.value = value;
      saveValue(_viewModel.value);
      var curOdom = 0.0;
      var fuelUsed = 0.0;
      if (!isEmptyString(wakeHourString)) {
        try {
          curOdom = double.parse(wakeHourString);
        } catch (e) {}
      }
      if (!isEmptyString(wakeMinuteString)) {
        try {
          fuelUsed = double.parse(wakeMinuteString);
        } catch (e) {

        }
      }
      _view.updateUnit(_viewModel.value);
      _view.updateWakeHour(wakeHour: _viewModel.wakeHourInString);
      _view.updateWakeMinute(wakeMinute: _viewModel.wakeMinuteInString);
    }
  }

  @override
  void onBedTimeOptionChanged(int value) {
    if (value != _viewModel.valueBedTime) {
      _viewModel.valueBedTime = value;
      saveValue(_viewModel.valueBedTime);

      _view.updateBedTimeUnit(_viewModel.valueBedTime);
    }
  }
  @override
  void onWakeTimeOptionChanged(int value) {
    if (value != _viewModel.valueBedTime) {
      _viewModel.valueBedTime = value;
      saveValue(_viewModel.valueBedTime);

      _view.updateWakeTimeUnit(_viewModel.valueBedTime);
    }
  }

  @override
  void onBedHourSubmitted(String hour) {
    try {
      _viewModel.bedHour = double.parse(hour);
    } catch (e) {

    }
  }

  @override
  void onBedMinuteSubmitted(String minute) {
    try {
      _viewModel.bedMinute = double.parse(minute);
    } catch (e) {

    }
  }

  @override
  void onWakeHourSubmitted(String sleepHour) {
    try {
      _viewModel.wakeHour = double.parse(sleepHour);
    } catch (e) {

    }
  }

  @override
  void onWakeMinuteSubmitted(String sleepMinute) {
    try {
      _viewModel.wakeMinute = double.parse(sleepMinute);
    } catch (e) {

    }
  }
}
