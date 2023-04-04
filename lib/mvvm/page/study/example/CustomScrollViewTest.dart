import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_study/utils/log.dart';
import 'package:get/get.dart';

class CustomScrollViewTestPage extends GetView {
  const CustomScrollViewTestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(), //ClampingScrollPhysics
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.blueGrey,
            //背景颜色(折叠后的背景色也是这个属性)
            expandedHeight: 160.0,
            //合并的高度，默认是状态栏的高度加AppBar的高度
            // leading: InkWell(//左侧的图标或文字，多为返回箭头
            //   onTap: (){
            //     Get.back();
            //   },
            //   child: const Icon(Icons.arrow_back_ios_new, color: Colors.white,),
            // ),
            automaticallyImplyLeading: true,
            //没有leading为true的时候，默认返回箭头, false不显示
            // title: const Text("title"),
            //标题
            actions: [
              //标题右侧的操作
              IconButton(
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ],
            elevation: 10,
            floating: true,//是否会发生下拉立即出现SliverAppBar
            //appbar阴影大小
            systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarIconBrightness: Brightness.light),
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const [
                //生效前提是SliverAppBar属性stretch=true
                StretchMode.zoomBackground,
                StretchMode.fadeTitle,
                // StretchMode.blurBackground
              ],
              title: const Text(
                'CustomScrollView Test',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              centerTitle: true,
              collapseMode: CollapseMode.pin,
              // titlePadding: const EdgeInsetsDirectional.only(
              //   start: 50.0,
              //   bottom: 16.0,
              // ),
              background: Image.asset(
                "images/zhichu.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverGrid(
              //Grid
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, //Grid按三列显示
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 4.0, //宽高比
              ),
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  //创建子widget
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.cyan[100 * (index % 9)],
                    child: Text('grid item $index'),
                  );
                },
                childCount: 8,
              ),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 50.0,
            delegate:
            SliverChildBuilderDelegate((BuildContext context, int index) {
              //创建列表项
              return Container(
                alignment: Alignment.center,
                color: Colors.lightBlue[100 * (index % 9)],
                child: Text('list item $index'),
              );
            }, childCount: 30 //50个列表项
            ),
          ),
        ],
      ),
    );
  }
}
