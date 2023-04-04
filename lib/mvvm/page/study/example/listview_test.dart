import 'package:flutter/material.dart';
import 'package:flutter_study/mvvm/commponets/title_bar.dart';
import 'package:get/get.dart';

class ListViewTestPage extends GetView {

  const ListViewTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    var items = List.generate(16, (index) => "item $index");
    return Scaffold(
      appBar: const TitleBar(
        title: "listview test",
      ),
      body: Container(
        color: Colors.grey,
        child: ListView.separated(
          scrollDirection: Axis.vertical,
          // reverse: true,
          shrinkWrap: false,
          itemCount: items.length,
          physics: const ClampingScrollPhysics(), //边界效果如阻尼效果/水波纹效果BouncingScrollPhysics
          itemBuilder: (context, index) {
            return Container(
              color: Colors.white,
              child: ListTile(
                title: Text(
                  items[index],
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return  Container(
              color: Colors.white,
              child: const Divider(
                // height: 1,
                color: Colors.red,
              ),
            );
          },
        ),
      ),
    );
  }
}
