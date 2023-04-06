import 'dart:typed_data';

import 'package:units/dreams/utils/dreams_utils.dart';
import 'package:units/dreams/viewmodel/dreams_sleep_diary_viewmodel.dart';
import 'package:units/dreams/views/sleep_diary_view/dreams_sleep_diary_view.dart';


class BEHAVIORPresenter{

  set diaryView(SleepDiaryView value){
    void onSubmitClicked(String diaryEntry) {}
 void printdiary(){}
 }
  }


class SleepDiaryPresenter implements BEHAVIORPresenter{

  SleepDiaryViewModel viewModel = new SleepDiaryViewModel();

  SleepDiaryPresenter() {}

  @override
  void onSubmitClicked(String diaryEntry){

    viewModel.sendToDatabase(diaryEntry);
  }
  @override
  void printdiary()
  {
   viewModel.loadUserData();
  }
  @override
  set diaryView(SleepDiaryView value) {
    // TODO: implement behaviorView
  }

}