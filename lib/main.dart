import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:navsocial/controller/auth_controller.dart';
import 'package:navsocial/controller/create_new_post_controller.dart';
import 'package:navsocial/controller/full_post_controller.dart';
import 'package:navsocial/controller/home_controller.dart';
import 'package:navsocial/controller/other_people_personal_controller.dart';
import 'package:navsocial/controller/search_controller.dart';
import 'package:navsocial/controller/updateinfo_controller.dart';
import 'package:navsocial/view/BottomNavTAB/Main/Newfeed.dart';
import 'package:navsocial/view/BottomNavTAB/Personal/Personal.dart';
import 'package:navsocial/view/BottomNavTAB/Personal/editprofile.dart';
import 'package:navsocial/view/BottomNavTAB/Personal/updateinfo.dart';
import 'package:navsocial/view/BottomNavTAB/Search/Search.dart';
import 'package:navsocial/view/FullPost/Display/create_new_post.dart';
import 'package:navsocial/view/Loading.dart';
import 'package:navsocial/view/Login.dart';
import 'package:navsocial/view/Home.dart';

import 'constants/controller.dart';
import 'constants/firebase.dart';
import 'controller/personal_controller.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  await initialization.then((value) {
    //put controller here
    Get.put(AuthController());
    Get.put(HomeController());
    Get.put(PersonalController());
    Get.put(SearchController());
    Get.put(OtherPeoplePersonalController());
    Get.put(FullPostController());
    Get.put(UpdateInfoController());
    Get.put(CreateNewPostController());
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      getPages: [
        GetPage(
          name: "/login",
          page: () => LoginPage(),
        ),
        GetPage(
          name: "/main",
          page: () => HomePage(),
        ),
        GetPage(name: "/search", page: () => SearchPage()),
        GetPage(name: "/newfeed", page: () => NewFeedPage()),
        GetPage(name: "/personal", page: () => PersonalPage()),
        GetPage(name: "/newpost", page: () => CreateNewPostPage()),
        GetPage(name: "/editprofile", page: () => EditProfilePage()),
        GetPage(name: "/updateinfo", page: () => UpdateInfoPages()),
      ],
      initialRoute: "/main",
    );
  }
}
