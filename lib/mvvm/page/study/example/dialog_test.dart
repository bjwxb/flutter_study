import 'package:flutter/material.dart';
import 'package:flutter_study/mvvm/commponets/title_bar.dart';
import 'package:flutter_study/mvvm/page/dialog/DialTelDialog.dart';
import 'package:get/get.dart';

import '../../../themes/app_theme.dart';

class DialogTestPage extends GetView {
  const DialogTestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:const TitleBar(title: "dialog test",),
      body: Column(
        children: [
          _itemButton("getX default dialog", callback: showGetXDialog),
          _itemButton("getX snackbar", callback: (){
            Get.snackbar(
              "title",
              "提示内容",
              backgroundColor: Colors.red,
              colorText: Colors.white,
              borderRadius: 3,
              onTap: (snack){
              }
            );
          }),
          _itemButton("bottom sheet", callback: showBottomSheet),
          _itemButton("自定义dialog", callback: (){
            Get.dialog(const DialTelDialog());
          }),
        ],
      ),
    );
  }

  void showGetXDialog(){
    Get.defaultDialog(
      title: '标题',
      titleStyle: const TextStyle(color: Colors.red, fontSize: 17),
      radius: 5,
      titlePadding: const EdgeInsets.only(top: 12),
      // middleText: "中间的提示语",
      // middleTextStyle: TextStyle(fontSize: 15, color: Colors.black87),
      content: Text("中间显示的widget"),
      // textConfirm: '确定',
      // confirmTextColor: Colors.black,
      // cancelTextColor: Colors.grey,
      confirm: MaterialButton(
        onPressed: () {},
        color: Colors.blue,
        child: Text('确定'),
      ),
      cancel: MaterialButton(
        onPressed: () {
          Get.back();
        },
        color: Colors.blue,
        child: Text('取消'),
      ),
      onConfirm: () {
        Get.back();
      },
      textCancel: "取消",
      // actions: [Icon(Icons.ac_unit), Icon(Icons.ac_unit_outlined)]
    );
  }

  void showBottomSheet(){
    Get.bottomSheet(
      Material(
        color: Colors.white,
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(
                Icons.wb_sunny_outlined,
                color: Colors.black,
              ),
              title: Text(
                "白天模式",
                style: TextStyle(color: !Get.isDarkMode ? Colors.red : Colors.black),
              ),
              onTap: () {
                Get.changeTheme(AppTheme.light);
                Get.back();
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.wb_sunny,
                color: Colors.black,
              ),
              title: Text(
                "黑夜模式",
                style: TextStyle(color: Get.isDarkMode ? Colors.red : Colors.black),
              ),
              onTap: () {
                Get.changeTheme(AppTheme.dark);
                Get.back();
              },
            )
          ],
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
