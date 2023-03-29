import 'package:units/dreams/viewmodel/dreams_sleep_data_viewmodel.dart';
import 'package:units/dreams/views/sleep_track_view/dreams_sleep_track_view.dart';
import '../viewmodel/dreams_track_sleep_viewmodel.dart';
import '../views/sleep_track_view/sleep_data_view/dreams_sleep_data_view.dart';

class SLEEPDATAPresenter{

  set SleepDataView(SLEEPDATAView value){

  }
  void onSubmitClicked(){

  }


}

class SleepDataPresenter implements SLEEPDATAPresenter{

  SLEEPDATAView _view = SLEEPDATAView();
  SleepDataViewModel viewModel = new SleepDataViewModel();

  SleepDataPresenter() {}

  @override
  void onSubmitClicked(){

  }

  @override
  set SleepDataView(SLEEPDATAView value) {
    // TODO: implement trackView
  }

}