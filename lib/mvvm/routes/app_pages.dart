import 'package:flutter/cupertino.dart';
import 'package:flutter_study/mvvm/page/home/home.dart';
import 'package:flutter_study/mvvm/page/main/main.dart';
import 'package:flutter_study/mvvm/page/main/main_binding.dart';
import 'package:flutter_study/mvvm/page/study/example/CustomScrollViewTest.dart';
import 'package:flutter_study/mvvm/page/study/example/ScrollTest.dart';
import 'package:flutter_study/mvvm/page/study/example/column_test.dart';
import 'package:flutter_study/mvvm/page/study/example/container/container_test.dart';
import 'package:flutter_study/mvvm/page/study/example/dialog_test.dart';
import 'package:flutter_study/mvvm/page/study/example/isolate_test.dart';
import 'package:flutter_study/mvvm/page/study/example/stack_test.dart';
import 'package:flutter_study/mvvm/page/study/example/listview_test.dart';
import 'package:flutter_study/mvvm/page/unknow/unknown_page.dart';
import 'package:flutter_study/mvvm/routes/app_routes.dart';
import 'package:get/get.dart';

import '../page/home/detail/home_detail.dart';
import '../page/home/detail/home_detail_binding.dart';

class AppPages {
  static var list = [
    GetPage(
        name: AppRoutes.root,
        page: () => const MainPage(),
        binding: MainBinding()
    ),
    GetPage(
      name: AppRoutes.homeDetail,
      page: () => HomeDetailPage(),
      binding: HomeDetailBinding(),
    ),
    //study/container test
    GetPage(name: AppRoutes.studyContainer, page: () => const ContainerTestPage()),
    GetPage(name: AppRoutes.studyStack, page: () => const StackTestPage()),
    GetPage(name: AppRoutes.studyListView, page: () => const ListViewTestPage()),
    GetPage(name: AppRoutes.studyColumn, page: () => const ColumnTestPage()),
    GetPage(name: AppRoutes.studyCustomScrollView, page: () => const CustomScrollViewTestPage()),
    GetPage(name: AppRoutes.studyScroll, page: () => const ScrollTestPage()),
    GetPage(name: AppRoutes.studyDialog, page: () => const DialogTestPage()),
    GetPage(name: AppRoutes.studyIsolate, page: () => IsolateTestPage()),
  ];

  static final unknownPage = GetPage(name: AppRoutes.unknownRoute, page: () => const UnknownPage());
}