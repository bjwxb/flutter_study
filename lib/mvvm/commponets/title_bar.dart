import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

/// 公用titleBar
class TitleBar extends StatefulWidget implements PreferredSizeWidget {
  //标题文本内容
  final String title;

  //是否隐藏返回按钮图标
  final bool hideBackImage;

  //titleBar 背景颜色
  final Color backgroundColor;

  //titleBar高度 默认为44
  final double height;

  //titleBar 阴影，默认为0.5相当于底线
  final double elevation;
  final List<Widget> actions;
  final bool centerTitle;
  final double titleSize;

  @override
  State<TitleBar> createState() => _TitleBarState();

  const TitleBar({
    Key? key,
    required this.title,
    this.actions = const <Widget>[],
    this.hideBackImage = false,
    this.elevation = 0.5,
    this.titleSize = 18,
    this.backgroundColor = Colors.white,
    this.height = 44,
    this.centerTitle = true,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class _TitleBarState extends State<TitleBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: widget.backgroundColor,
      leading: widget.hideBackImage
          ? const Icon(
              Icons.arrow_back_ios,
              color: Colors.transparent,
            )
          : IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.black,
              ),
            ),
      title: Text(
        widget.title,
        style: TextStyle(color: Colors.black87, fontSize: widget.titleSize),
      ),
      centerTitle: widget.centerTitle,
      elevation: widget.elevation,
      // systemOverlayStyle: const SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
      actions: widget.actions,
    );
  }
}
