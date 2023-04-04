import 'package:dio/dio.dart';
import 'package:flutter_study/mvvm/page/base/load_state.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  var state = LoadState.State_Loading.obs;

  Future requestData(dynamic f) async {
    var result;
    try {
      setLoading();
      result = await f;
      if(null == result){
        setError(Error());
      }
    } catch (e) {
      setError(Error(), message: "请求失败");
      throw Exception(e);
    }
    return result;
  }

  Future<dynamic> requestNoStatusData(dynamic f) async {
    var result;
    try {
      result = await f;
    } catch (e) {
      throw Exception(e);
    }
    return result;
  }

  /// 初始化状态
  void setLoading() {
    setState(LoadState.State_Loading);
  }

  /// 数据成功不为空
  void setSuccess() {
    setState(LoadState.State_Success);
  }

  /// 数据成功且为空
  void setEmpty() {
    setState(LoadState.State_Empty);
  }

  /// 数据异常
  void setError(e, {String? message}) {
    if (e is DioError) {
      e = e.error;
      message = e.message;
    }
    setState(LoadState.State_Error);
  }

  ///没有网络
  void setNoNetWork() {
    setState(LoadState.No_Network);
  }

  /// 设置状态改变
  void setState(LoadState state) {
    this.state.value = state;
  }

  /// 加载中状态
  bool isLoading() {
    return this.state.value == LoadState.State_Loading;
  }

  /// 数据为空状态
  bool isEmpty() {
    return this.state.value == LoadState.State_Empty;
  }

  /// 数据异常状态
  bool isError() {
    return this.state.value == LoadState.State_Error;
  }

  /// 数据加载成功状态 不为空
  bool isSuccess() {
    return this.state.value == LoadState.State_Success;
  }

  bool isNoNetWork() {
    return this.state.value == LoadState.No_Network;
  }
}
