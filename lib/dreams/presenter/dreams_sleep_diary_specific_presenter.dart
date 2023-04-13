
import 'package:units/dreams/viewmodel/dreams_sleep_diary_specific_viewmodel.dart';
import 'package:units/dreams/views/sleep_diary_view/dreams_sleep_diary_view.dart';

class BEHAVIORPresenter{

  set diaryView(SleepDiaryView value){
    void onSubmitClicked(String date) {}
  }
}


class SleepDiarySpecificPresenter implements BEHAVIORPresenter{

  SleepDiarySpecificViewModel viewModel = new SleepDiarySpecificViewModel();

  SleepDiarySpecificPresenter() {}

  @override
  void onSubmitClicked(String date){

  }

  @override
  set diaryView(SleepDiaryView value) {
    // TODO: implement behaviorView
  }

}