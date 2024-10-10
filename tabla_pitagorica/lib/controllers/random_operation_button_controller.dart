import 'dart:math';

class OperationButtonController {
  final int size;

  OperationButtonController(this.size);

  List<int> getRandomOperation() {
    final random = Random();
    int row = random.nextInt(size + 1);
    int col = random.nextInt(size + 1);
    int result = row * col;
    return [row, col, result];
  }
}
