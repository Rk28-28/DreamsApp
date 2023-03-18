import 'package:units/dreams/utils/dreams_utils.dart';
import 'package:units/dreams/views/sleep_track_view/dreams_sleep_track_view.dart';

class TRACKPresenter{
  String? onSubmitClicked(String bedTime, String wakeUpTime, double sleepRating){
  }
  set trackView(TRACKView value){

  }
}

class TrackSleepPresenter implements TRACKPresenter{

  TrackSleepPresenter();

  @override
  set trackView(TRACKView value) {
    // TODO: implement trackView
  }

  @override
  String onSubmitClicked(String bedTime, String wakeUpTime, double sleepRating) {
    return calculateAverageSleep(bedTime, wakeUpTime);
  }

}