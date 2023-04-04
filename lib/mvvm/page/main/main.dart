import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/mvvm/page/home/home.dart';
import 'package:flutter_study/mvvm/page/main/main_controller.dart';
import 'package:flutter_study/mvvm/page/mall/mall.dart';
import 'package:flutter_study/mvvm/page/mine/mine.dart';
import 'package:flutter_study/mvvm/page/study/study.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
          child: IndexedStack(
            index: controller.tabIndex,
            children: const [HomePage(), MallPage(), StudyPage(), MinePage()],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: controller.changeTabIndex,
          elevation: 1,
          currentIndex: controller.tabIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            _bottomNavigationBarItem(CupertinoIcons.home, '首页'),
            _bottomNavigationBarItem(CupertinoIcons.music_albums, '分类'),
            _bottomNavigationBarItem(CupertinoIcons.alarm, '论坛'),
            _bottomNavigationBarItem(CupertinoIcons.person_2_alt, '我的')
          ],
        ),

      );
    });
  }

  _bottomNavigationBarItem(IconData icon, String lable) {
    return BottomNavigationBarItem(icon: Icon(icon), label: lable);
  }
}
