import 'package:units/dreams/utils/dreams_utils.dart';
import 'package:units/dreams/viewmodel/dreams_track_sleep_viewmodel.dart';
import 'package:units/dreams/views/sleep_track_view/dreams_sleep_track_view.dart';

import '../utils/dreams_constant.dart';

class TRACKPresenter{

  set trackView(TRACKView value){

  }
  void onSubmitClicked(int bedHour, int bedMinute, int bedAmPm,
      int wakeHour, int wakeMinute, int wakeAmPm, double sleepRating){

  }

set unitsView(TRACKView value){}

}
class TrackSleepPresenter implements TRACKPresenter {

  @override
  set trackView(TRACKView value) {
    // TODO: implement trackView
  }


  TRACKView _view = TRACKView();

  TrackSleepPresenter();
  

  @override
  void onSubmitClicked(int bedHour, int bedMinute, int bedAmPm,
  int wakeHour, int wakeMinute, int wakeAmPm, double sleepRating){

    double totalSleepInHours = calculateHoursSlept(bedHour, bedMinute,
        bedAmPm, wakeHour, wakeMinute, wakeAmPm);
    print(totalSleepInHours);
    
// TODO: sends things to databases????
    }

  @override
  set unitsView(TRACKView value) {
    // TODO: implement unitsView
  }
}
    
    
  
