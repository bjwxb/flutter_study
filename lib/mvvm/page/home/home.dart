import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_study/mvvm/commponets/title_bar.dart';
import 'package:flutter_study/mvvm/page/home/home_controller.dart';
import 'package:flutter_study/utils/log.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    logD(">>>>> home build <<<<<");
    return Scaffold(
      appBar: const TitleBar(
        title: 'home',
        hideBackImage: true,
      ),
      body: Material(
        color: Colors.black12,
        child: Center(
          child: Column(
            children: [
              _itemButton('getX跳转带参数', callback: () async {
                // Get.to(HomeDetailPage());//直接跳转
                // Get.to(AppRoutes.homeDetail);//通过注册的路由表名字跳转
                // Get.off(HomeDetailPage());//跳转页面并关闭之前的页面
                // Get.offAll(HomeDetailPage());//跳转页面并关闭之前的全部页面
                // Get.offNamed('/');//通过路由关闭跳转
                // Get.offAllNamed('/');
                // Get.toNamed('/');
                var res = await Get.toNamed(AppRoutes.homeDetail, parameters: {"name": "July"});
                if (null != res) {
                  controller.btnTip.value = '返回参数 - ${res['result']}';
                  Get.snackbar("返回值", "success -> " + res["result"].toString(), backgroundColor: Colors.white);
                }
              }),
              _itemButton("obx add list", callback: (){
                controller.updateList('android${Random().nextInt(100)}');
              }),
              _itemButton("remove list first", callback: (){
                controller.deleteFirst();
              }),
              Obx(() {
                return Container(
                  color: Colors.grey,
                  constraints: const BoxConstraints(
                    maxHeight: 200
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    children: controller.list.map((e){
                      return Center(child: Text('$e'));
                    }).toList(),
                  ),
                );
              }),
              _itemButton("change list by GetBuilder", callback: (){
                controller.updateListGetBuilder("java${Random().nextInt(10)}");
              }),
              GetBuilder<HomeController>(builder: (controller){
                return Container(
                  color: Colors.blue,
                  padding: const EdgeInsets.all(10),
                  child: Wrap(
                    children: controller.listGetBuilder.map((e){
                      return Container(
                        color: Colors.red,
                        margin: const EdgeInsets.all(3),
                        padding: const EdgeInsets.all(3),
                        constraints: const BoxConstraints(
                          minWidth: 60,
                        ),
                          child: Text('$e', style: TextStyle(color: Colors.white),)
                      );
                    }).toList(),
                  ),
                );
              })

            ],
          )
        ),
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
              const EdgeInsets.symmetric(vertical: 5, horizontal: 15)),
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
          style: const TextStyle(fontSize: 15, color: Colors.red),
        ),
      ),
    );
  }
}
