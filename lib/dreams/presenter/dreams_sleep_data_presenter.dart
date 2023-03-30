import 'package:flutter/src/widgets/editable_text.dart';
import 'package:units/dreams/viewmodel/dreams_sleep_data_viewmodel.dart';
import 'package:units/dreams/views/sleep_track_view/dreams_sleep_track_view.dart';
import '../viewmodel/dreams_track_sleep_viewmodel.dart';
import '../views/sleep_track_view/sleep_data_view/dreams_sleep_data_view.dart';

class SLEEPDATAPresenter{

  set SleepDataView(SLEEPDATAView value){

  }
  void onSubmitClicked(int firstGroupValue, int secondGroupValue, TextEditingController myController){

  }


}

class SleepDataPresenter implements SLEEPDATAPresenter{

  SLEEPDATAView _view = SLEEPDATAView();
  SleepDataViewModel viewModel = new SleepDataViewModel();

  SleepDataPresenter();

  @override
  void onSubmitClicked(int firstGroupValue, int secondGroupValue, TextEditingController myController){
    String _sleepFeelings = '';
    _sleepFeelings = myController.text.toString();
    print(myController);

  viewModel.sendToDatabase(_sleepFeelings);
  }

  @override
  set SleepDataView(SLEEPDATAView value) {
    // TODO: implement trackView
  }

}