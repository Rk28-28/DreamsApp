

import 'package:units/dreams/viewmodel/dreams_track_behavior_viewmodel.dart';

import '../views/behavior_track_views/dreams_behavior_view.dart';
import '../views/behavior_track_views/dreams_track_behavior_component.dart';

class BEHAVIORPresenter{

  set trackView(BEHAVIORView value){

  }
}

class TrackBehaviorPresenter implements BEHAVIORPresenter{

  BehaviorTrackViewModel viewModel = new BehaviorTrackViewModel();

  TrackBehaviorPresenter();


  @override
  void onSubmitClicked(String cal, String cafconsumption, double sliderval){

    viewModel.sendToDatabase(cal,cafconsumption,sliderval);
  }

  @override
  set trackView(BEHAVIORView value) {
    // TODO: implement behaviorView
  }

}
