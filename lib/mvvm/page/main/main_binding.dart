import 'package:flutter_study/mvvm/page/home/home_controller.dart';
import 'package:flutter_study/mvvm/page/main/main_controller.dart';
import 'package:flutter_study/mvvm/page/mall/mall_controller.dart';
import 'package:flutter_study/mvvm/page/mine/mine_controller.dart';
import 'package:flutter_study/mvvm/page/study/study_controller.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => MainController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => MallController());
    Get.lazyPut(() => StudyController());
    Get.lazyPut(() => MineController());
  }

}