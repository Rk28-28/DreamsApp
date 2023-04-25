import 'package:units/dreams/viewmodel/dreams_sleep_dataview_viewmodel.dart';
import 'package:units/dreams/views/sleep_track_view/sleep_dataview_view/dreams_sleep_dataview_view.dart';

class DataViewPresenter {
  set dataView(SleepDataViewView value) {}
}

class SleepDataViewPresenter implements DataViewPresenter {
  SleepDataViewView _view = SleepDataViewView();
  SleepDataViewViewModel viewModel = new SleepDataViewViewModel();

  SleepDataViewPresenter();

  @override
  set dataView(SleepDataViewView value) {}
}
