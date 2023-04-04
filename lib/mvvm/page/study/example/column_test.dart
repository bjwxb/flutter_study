import 'package:flutter/material.dart';
import 'package:flutter_study/mvvm/commponets/title_bar.dart';
import 'package:get/get.dart';

class ColumnTestPage extends GetView {
  const ColumnTestPage({Key? key}) : super(key: key);

  List<Widget> _getData() {
    List<Widget> list = [];
    for (int i = 0; i < 7; i++) {
      list.add(itemButtonTest("item $i"));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TitleBar(
        title: "column/row test",
      ),
      body: Container(
        color: Colors.black12,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            itemButtonTest("item 1"),
            SizedBox(
              width: 200,
              child: itemButtonTest("item 2"),
            ),
            Wrap(
              spacing: 8.0, // 主轴(水平)方向间距
              runSpacing: 4.0, // 纵轴（垂直）方向间距
              alignment: WrapAlignment.start, //沿主轴方向居中
              children: <Widget>[
                const Chip(
                  avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('A')),
                  label: Text('Hamilton'),
                ),
                const Chip(
                  avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('M')),
                  label: Text('Lafayette'),
                ),
                const Chip(
                  avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('H')),
                  label: Text('Mulligan'),
                ),
                const Chip(
                  avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('J')),
                  label: Text('Laurens'),
                ),
                const Chip(
                  avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('J')),
                  label: Text('java'),
                ),
                const  Chip(
                  avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('J')),
                  label: Text('ja'),
                ),
                //Flex的两个子widget按1：2来占据水平空间
                Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Container(
                        alignment: Alignment.center,
                        height: 50.0,
                        color: Colors.red,
                        child: const Text('flex = 2'),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.center,
                        height: 50.0,
                        color: Colors.green,
                        child: const Text('flex = 1'),
                      ),
                    ),
                  ],
                ),
                Container(
                  color: Colors.blueGrey,
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  child: SizedBox(
                    height: 200.0,
                    //Flex的三个子widget，在垂直方向按2：1：1来占用100像素的空间
                    child: Flex(
                      direction: Axis.vertical,
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Container(
                            color: Colors.red,
                            child: const Text("flex=2"),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.center,
                            color: Colors.green,
                            child: const Text("flex=1"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            itemButtonTest("item 3"),
            Expanded(
              flex: 0,
              child: Container(
                color: Colors.blueGrey,
                padding: const EdgeInsets.only(top:20, bottom: 20),
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      color: Colors.red,
                      child: const Text("row 1"),
                    ),
                    Container(
                      color: Colors.red,
                      child: const Text("row 2"),
                    ),
                    Container(
                      color: Colors.red,
                      child: const Text("row 3"),
                    ),
                    // Expanded(
                    //   child: Container(
                    //     color: Colors.grey,
                    //     child: Text("row 4"),
                    //   ),
                    //   flex: 1,
                    // )
                  ],
                ),
              ),
            ),
            // Expanded(
            //   flex: 3,
            //   child: itemButtonTest("item 4"),
            // ),
          ],
        ),
      ),
    );
  }
}

Widget itemButtonTest(String text, {VoidCallback? callback}) {
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
