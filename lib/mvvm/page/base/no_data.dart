import 'package:flutter/material.dart';

///空页面
class NoDataView extends StatefulWidget {
  final VoidCallback? clickRetry;
  final String? desc;

  const NoDataView(this.clickRetry, {this.desc, Key? key}) : super(key: key);

  @override
  State<NoDataView> createState() => _NoDataViewState();
}

class _NoDataViewState extends State<NoDataView> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey[200],
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.only(bottom: 200),
        child: InkWell(
          onTap: widget.clickRetry,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                width: 160,
                height: 160,
                child: Icon(Icons.network_check_sharp),
              ),
              Text(
                widget.desc ?? '暂无数据',
                style: const TextStyle(color: Colors.grey, fontSize: 15),
              )
            ],
          ),
        ));
  }
}
