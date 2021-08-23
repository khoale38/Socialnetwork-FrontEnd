import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navsocial/view/BottomNavTAB/Personal/Widget/personal_media_widget.dart';

class PersonalController extends GetxController
    with SingleGetTickerProviderMixin {
  static PersonalController instance = Get.find();




  final listTabItem = [
    Tab(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.tv),
          SizedBox(width: 8),
          Text('Your Media'),
        ],
      ),
    )
  ];
  final listTab = [
    PersonalMedia(),
  ];

  TabController tabController;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(vsync: this, length: listTabItem.length);

  }
}
