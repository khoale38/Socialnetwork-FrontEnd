import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navsocial/view/FullPost/OtherPeople/other_people_personal_widget.dart';

class OtherPeoplePersonalController extends GetxController with SingleGetTickerProviderMixin
{
  static OtherPeoplePersonalController instance = Get.find();

  final listTabItem = [
    Tab(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.tv),
          SizedBox(width: 8),
          Text('Their Media'),
        ],
      ),
    )
  ];
  final listTab = [
    OtherPeoplePersonal(),
  ];

  TabController tabController;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(vsync: this, length: listTabItem.length);

  }

}