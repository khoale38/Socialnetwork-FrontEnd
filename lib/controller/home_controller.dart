import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navsocial/view/BottomNavTAB/Search/Search.dart';
import 'package:navsocial/view/BottomNavTAB/Main/Newfeed.dart';
import 'package:navsocial/view/BottomNavTAB/Personal/Personal.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';


class HomeController extends GetxController with SingleGetTickerProviderMixin {
  static HomeController instance = Get.find();

/*  final listTabItem = [
    Tab(icon: Icon(Icons.web_sharp)),
    Tab(icon: Icon(Icons.account_box_rounded)),
  ];*/

  List<PersistentBottomNavBarItem> listTabItem() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.web_sharp),
        activeColorPrimary: CupertinoColors.systemYellow,
        activeColorSecondary: CupertinoColors.black,
        inactiveColorPrimary: CupertinoColors.white,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.search),
        activeColorPrimary: CupertinoColors.systemYellow,
        activeColorSecondary: CupertinoColors.black,
        inactiveColorPrimary: CupertinoColors.white,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.account_box_rounded),
        activeColorPrimary: CupertinoColors.systemYellow,
        activeColorSecondary: CupertinoColors.black,
        inactiveColorPrimary: CupertinoColors.white,
      ),
    ];
  }

  List<Widget> tabPage() {
    return [
      NewFeedPage(),
      SearchPage(),
      PersonalPage()
    ];
  }

  PersistentTabController controller= PersistentTabController(initialIndex: 0);

}
