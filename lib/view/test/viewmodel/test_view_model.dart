import 'package:mobx/mobx.dart';
part 'test_view_model.g.dart';

// ignore: library_private_types_in_public_api
class TestViewModel = _TestViewModelBase with _$TestViewModel;

abstract class _TestViewModelBase with Store {
  @observable
  int counter = 0;

  @action
  void incrementCounter() {
    counter++;
  }

  @action
  void decrementCounter() {
    counter--;
  }
}
