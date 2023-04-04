import 'package:get/get.dart';

class MallController extends GetxController {
  var count = 1.obs;

  void increaseCount() {
    count++;
  }
}