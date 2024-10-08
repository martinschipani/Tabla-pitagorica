import '../models/random_operation_button.dart';

class RandomOperationButtonController {
  final RandomOperationButtonModel model;

  RandomOperationButtonController(this.model);

  List<int> getRandomOperation(int size) {
    return model.getRandomOperation(size);
  }
}