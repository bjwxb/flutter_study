import 'package:flutter/material.dart';
import 'package:flutter_study/utils/log.dart';

class Counter extends ChangeNotifier{
  var count = 1;

  void increment(){
    logD("------- increment");
    count++;
    notifyListeners();
  }
}