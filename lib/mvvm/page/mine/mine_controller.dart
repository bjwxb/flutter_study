import 'package:get/get.dart';

class MineController extends GetxController {
  var count = 1.obs;

  void increaseCount() {
    count++;
  }
}