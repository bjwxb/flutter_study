import 'package:flutter/services.dart';
import 'package:flutter_study/utils/log.dart';
import 'package:get/get.dart';

class HomeController extends SuperController{

  var list = ['kotlin', 'python', 'flutter'].obs;

  var listGetBuilder = ['kotlin', 'python', 'flutter'];

  var btnTip = "页面跳转".obs;

  void updateList(String content){
    list.add(content);
  }

  void updateListGetBuilder(String content){
    listGetBuilder.add(content);
    update();
  }

  void deleteFirst(){
    if(list.isNotEmpty){
      list.removeAt(0);
    }
  }

  @override
  void onDetached() {
    logE(">>>>> homeDetail onDetached <<<<<");
  }

  @override
  void onInactive() {
    logE("***** homeDetail onInactive <<<<<");
  }

  @override
  void onPaused() {
    logE("------ homeDetail onPaused <<<<<");
  }

  @override
  void onResumed() {
    logE("===== homeDetail onResumed <<<<<");
    logE(">>>>>>> ${SystemUiOverlayStyle().statusBarIconBrightness}");
    SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle().copyWith(
        statusBarIconBrightness: Brightness.dark
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}