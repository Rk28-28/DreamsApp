import 'package:units/dreams/viewmodel/dreams_sleep_diaryview_viewmodel.dart';
import 'package:units/dreams/views/sleep_diary_view/dreams_sleep_diary_view.dart';

class DiaryViewPresenter {
  SleepDiaryViewModel viewModel = new SleepDiaryViewModel();

  set trackView(SleepDiaryView value) {
    @override
    List<String> printdiary()
    {
      List<String> s = viewModel.loadUserData();
      return s;
    }
  }


}



class SleepDiaryViewPresenter implements DiaryViewPresenter{
  @override
  set trackView(value) {
    // TODO: implement trackView
  }

  @override
  SleepDiaryViewModel viewModel = new SleepDiaryViewModel();

  @override
  List<String> printdiary()
  {
    List<String> s = viewModel.loadUserData();
    return s;
  }

}
