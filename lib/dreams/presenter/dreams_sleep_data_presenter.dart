import 'package:flutter/src/widgets/editable_text.dart';
import 'package:units/dreams/viewmodel/dreams_sleep_data_viewmodel.dart';

import '../views/sleep_track_view/sleep_data_view/dreams_sleep_data_view.dart';

class SLEEPDATAPresenter {
  set SleepDataView(SLEEPDATAView value) {}

  void onSubmitClicked(int firstGroupValue, int secondGroupValue,
      TextEditingController myController) {}
}

class SleepDataPresenter implements SLEEPDATAPresenter {
  SLEEPDATAView _view = SLEEPDATAView();
  SleepDataViewModel viewModel = new SleepDataViewModel();

  SleepDataPresenter();

  @override
  void onSubmitClicked(int firstGroupValue, int secondGroupValue,
      TextEditingController myController) {
    String _sleepFeelings = '';
    String first = firstGroupValue.toString();
    String second = secondGroupValue.toString();
    String _awaken = '';
    String _memory = '';
    switch (first) {
      case "-1":
        {
          _awaken = 'no option selected';
        }
        break;
      case "0":
        {
          _awaken = 'Yes';
        }
        break;
      case "1":
        {
          _awaken = 'No';
        }
    }

    switch (second) {
      case "-1":
        {
          _memory = 'no option selected';
        }
        break;
      case "2":
        {
          _memory = 'Dream';
        }
        break;
      case "3":
        {
          _memory = 'Nightmare';
        }
        break;
      case "4":
        {
          _memory = 'Neither';
        }
    }

    _sleepFeelings = myController.text.toString();
    print(myController);

    viewModel.sendToDatabase(_sleepFeelings, _awaken, _memory);
  }

  @override
  set SleepDataView(SLEEPDATAView value) {
    // TODO: implement trackView
  }
}
