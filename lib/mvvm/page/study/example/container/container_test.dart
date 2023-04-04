import 'package:flutter/material.dart';
import 'package:flutter_study/mvvm/commponets/title_bar.dart';
import 'package:flutter_study/mvvm/page/study/example/container/container_test_controller.dart';
import 'package:get/get.dart';

///container 相关
class ContainerTestPage extends GetView<ContainerTestController> {
  const ContainerTestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TitleBar(title: "container 学习"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: double.infinity,
            height: 200,
            color: Colors.black12,
            alignment: Alignment.topRight,
            //Alignment.xxx 等9种已定义属性，Alignment(-1.0, 0.0),与世界坐标等y轴相反
            child: Container(
              // color: Colors.red,//背景颜色
              width: 200,
              height: 100,
              margin: const EdgeInsets.all(10),
              //only, all, symmetric
              padding: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                //设置了decoration， 就不可以在外层设置color属性
                border: Border.all(
                    width: 2, color: Colors.blue, style: BorderStyle.solid),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.blueGrey, blurRadius: 10, spreadRadius: 5)
                ],
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                color: Colors.red,
                // gradient: const LinearGradient(colors: [Colors.black12, Colors.black38])//渐变
              ),
              alignment: Alignment.bottomCenter,
              child: Text("hah"),
            ),
          ),
          Container(
            width: double.infinity,
            height: 200,
            color: Colors.black38,
            alignment: Alignment.bottomLeft,
            //Alignment.xxx 等9种已定义属性，Alignment(-1.0, 0.0),与世界坐标等y轴相反
            child: Container(
              color: Colors.red,
              //背景颜色
              constraints: const BoxConstraints(minHeight: 100, minWidth: 100),
              margin: const EdgeInsets.all(10),
              //only, all, symmetric
              padding: const EdgeInsets.only(bottom: 20, top: 10, left: 10),
              // alignment: Alignment.topCenter,//这个属性会影响约束属性
              child: const Text(
                "hello worldhello worldhello world",
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
          ),
          Container(
            color: Colors.blue,
            child: SizedBox.fromSize(
              size: const Size(200, 100),
              child: const Text("size box"),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10),
            child: Text("padding"),
          ),
          Expanded(//占满剩余空间
              flex: 1,
              child: Container(
                color: Colors.blueGrey,
                child: const Text(
                  "Hello World, 曾经沧海难为水，除却巫山不是曾aa经沧海难为水，除却巫山不是曾经沧海难为水，除却巫山不是云",
                  textAlign: TextAlign.left,
//            textDirection: TextDirection.rtl,//同textAlign
                  textScaleFactor: 1,
//            softWrap: false,
                  overflow: TextOverflow.fade, //ellipsis, fade
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    //normal bold, w300
                    height: 1.5,
                    //通过高度倍数设置行间距
//              backgroundColor:  Color.fromARGB(255, 0, 255, 255),//设置背景色，中英文混合时有问题
                    color: Color.fromARGB(222, 255, 0, 100),
                    letterSpacing: 3,
                    //字符间距
//              wordSpacing: 0,//????
                    decoration: TextDecoration.underline,
                    //lineThrough,underline
                    decorationColor: Color.fromARGB(222, 100, 0, 10),
                    decorationStyle: TextDecorationStyle
                        .solid, //dotted, dashed,double, solid, wavy
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
