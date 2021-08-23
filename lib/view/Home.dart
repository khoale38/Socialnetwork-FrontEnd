import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navsocial/constants/controller.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PersistentTabView(
        context,
        confineInSafeArea: true,
        backgroundColor: Colors.black,
        screens: homeController.tabPage(),
        controller: homeController.controller,
        items: homeController.listTabItem(),
        resizeToAvoidBottomInset: true,
        navBarStyle: NavBarStyle.style10,
        //need to set type
        popAllScreensOnTapOfSelectedTab: true,
        itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
      ),
    );
  }
}
