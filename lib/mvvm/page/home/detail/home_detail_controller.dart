import 'package:flutter_study/mvvm/page/base/base_controller.dart';
import 'package:flutter_study/utils/log.dart';
import 'package:get/get.dart';

class HomeDetailController extends BaseController{

  var count = 1;
  var count2 = 1.obs;

  void increaseCountByObs(){
    count2++;
  }
  void increaseCount(){
    logD("===== count = $count");
    count++;
    update();
  }

  void getData(){
    Future.delayed(const Duration(milliseconds: 500), (){
      // setError(null);
      getSuccessData();
    });
  }

  void getSuccessData(){
    Future.delayed(const Duration(milliseconds: 500), (){
      setSuccess();
    });
  }
}