import 'package:flutter_study/mvvm/page/home/detail/home_detail_controller.dart';
import 'package:get/get.dart';

class HomeDetailBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => HomeDetailController());
  }
}