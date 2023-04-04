import 'package:flutter/services.dart';
import 'package:flutter_study/utils/log.dart';
import 'package:get/get.dart';

class MainController extends SuperController{
  int tabIndex = 0;

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }

  @override
  void onDetached() {
  }

  @override
  void onInactive() {
  }

  @override
  void onPaused() {
    logE("------ ${SystemUiOverlayStyle().statusBarIconBrightness}");
  }

  @override
  void onResumed() {

  }
}