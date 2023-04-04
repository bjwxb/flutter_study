import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_study/mvvm/page/study/example/state_test.dart';
import 'package:flutter_study/mvvm/page/study/study_controller.dart';
import 'package:flutter_study/mvvm/routes/app_routes.dart';
import 'package:flutter_study/utils/log.dart';
import 'package:get/get.dart';

import 'example/isolate_test.dart';

/// 控件学习
class StudyPage extends GetView<StudyController> {
  const StudyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    logD("====== study build -======");
    controller.obs.map((data) => {printInfo(info: ">> $data")});
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Column(
        children: [
          _itemButton('container学习', callback: ()=>{
            Get.toNamed(AppRoutes.studyContainer)
          }),
          _itemButton('stack 学习', callback: ()=>{
            Get.toNamed(AppRoutes.studyStack)
          }),
          _itemButton('Column/row 学习', callback: ()=>{
            // Get.to(HomeDetailPage());//直接跳转
            // Get.to(AppRoutes.homeDetail);//通过注册的路由表名字跳转
            // Get.off(HomeDetailPage());//跳转页面并关闭之前的页面
            // Get.offAll(HomeDetailPage());//跳转页面并关闭之前的全部页面
            // Get.offNamed('/');//通过路由关闭跳转
            // Get.offAllNamed('/');
            // Get.toNamed('/');
            Get.toNamed(AppRoutes.studyColumn)
          }),
          _itemButton('listview 学习', callback: ()=>{
            Get.toNamed(AppRoutes.studyListView)
          }),
          _itemButton('customScrollView 学习', callback: () async {
            var res = await Get.toNamed(AppRoutes.studyCustomScrollView);
          }),
          _itemButton('ScrollView 学习', callback: ()=>{
            Get.toNamed(AppRoutes.studyScroll)
          }),
          _itemButton('dialog 学习', callback: ()=>{
            Get.toNamed(AppRoutes.studyDialog)
          }),
          _itemButton('Isolate 学习', callback: () async{
            Get.toNamed(AppRoutes.studyIsolate);
          }),
          _itemButton('state test', callback: () async{
            Navigator.push(context, MaterialPageRoute<void>(
              builder: (BuildContext context) {
                return const StateTestPae();
              },
            ));
          }),
          _itemButton("获取设备信息", callback: () async {
            var devicePluginInfo = DeviceInfoPlugin();
            var androidInfo = await devicePluginInfo.androidInfo;
            logD(androidInfo.toMap().toString());
          })
        ]
      ),
    );
  }
  Widget _itemButton(String text, {VoidCallback? callback}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: TextButton(
        onPressed: callback,
        style: ButtonStyle(
          // textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 16.0, color: Colors.white)),
          //背景颜色
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            //设置按下时的背景颜色
            if (states.contains(MaterialState.pressed)) {
              return Colors.blue.withOpacity(0.7);
            }
            //默认不使用背景颜色
            return Colors.blue.withOpacity(0.5);
          }),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          enableFeedback: true,
          //设置水波纹颜色
          overlayColor: MaterialStateProperty.all(Colors.blue),
          //去掉水波纹
          // splashFactory: NoSplash.splashFactory,
          // shadowColor: MaterialStateProperty.all(Colors.transparent),
          // elevation: MaterialStateProperty.all(3),
          //设置按钮内边距
          padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w)),
          //设置按钮的大小
          // minimumSize: MaterialStateProperty.all(const Size(250, 50)),
          minimumSize: MaterialStateProperty.all(const Size(double.infinity, 50)),
          //设置边框
          side: MaterialStateProperty.all(
              const BorderSide(color: Colors.red, width: 1)),
          //外边框装饰 会覆盖 side 配置的样式
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
          // shape: MaterialStateProperty.all(const StadiumBorder()),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 15.sp, color: Colors.red),
        ),
      ),
    );
  }
}
