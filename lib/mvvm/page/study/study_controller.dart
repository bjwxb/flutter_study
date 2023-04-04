import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_study/utils/log.dart';
import 'package:get/get.dart';

class StudyController extends GetxController{
  var list = ['container学习', 'flex学习'].obs;


  @override
  void onInit() {
    logD(">>>> onInit <<<<");
    super.onInit();
  }

  @override
  void onReady() {
    logD("--- onReady ---");
    super.onReady();
  }

  @override
  void onClose() {
    logD(">>>> onClose <<<<");
    super.onClose();
  }
}