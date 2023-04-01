

import 'package:units/dreams/viewmodel/dreams_track_behavior_viewmodel.dart';

import '../views/behavior_track_views/dreams_behavior_view.dart';
import '../views/behavior_track_views/dreams_track_behavior_component.dart';

class BEHAVIORPresenter {
  BehaviorTrackViewModel viewModel = new BehaviorTrackViewModel();

  set trackView(BEHAVIORView value) {
    void onSubmitClicked(){
    }
  }

  void onSubmitClicked(String cal, String cafconsumption, double sliderval){

    viewModel.sendToDatabase(cal,cafconsumption,sliderval);
  }
}



class TrackBehaviorPresenter implements BEHAVIORPresenter{

  @override
  set trackView(BEHAVIORView value) {
    // TODO: implement behaviorView
  }

  BehaviorTrackViewModel viewModel = new BehaviorTrackViewModel();

  TrackBehaviorPresenter() {}

  @override
  void onSubmitClicked(String cal, String cafconsumption, double sliderval){

    viewModel.sendToDatabase(cal,cafconsumption,sliderval);
  }

}
