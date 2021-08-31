import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:navsocial/constants/controller.dart';
import 'package:shimmer/shimmer.dart';

class PersonalPage extends StatelessWidget {
  const PersonalPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: CachedNetworkImage(
                  imageUrl: authController.auth.currentUser.photoURL ??
                      "https://www.google.com/",
                  imageBuilder: (context, imageProvider) => CircleAvatar(
                    radius: 50,
                    backgroundImage: imageProvider,
                  ),
                  errorWidget: (context, url, error) => CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("assets/logo/logo.png"),
                  ),
                  placeholder: (context, url) => Shimmer.fromColors(
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.black,
                    ),
                    baseColor: Colors.grey,
                    highlightColor: Colors.grey[100],
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.only(left: 10,top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        authController.auth.currentUser.displayName != null
                            ? authController.auth.currentUser.displayName
                            : "Nick Name",
                        style:
                            TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      OutlinedButton.icon(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: Colors.grey,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3),
                              side: BorderSide(color: Colors.grey, width: 1)),
                        ),
                        onPressed: () {
                          Get.toNamed("/editprofile");
                        },
                        icon: Icon(Icons.edit,color: Colors.grey,size: 20),
                        label: Text(
                          'Edit Profile',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            fontWeight: FontWeight.w600
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          TabBar(
            labelPadding: EdgeInsets.zero,
            labelStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            labelColor: Colors.black,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(
                  width: 3.0,
                  style: BorderStyle.solid,
                  color: Colors.grey),
              insets: EdgeInsets.symmetric(horizontal: size.width * 0.3),
            ),
            controller: personalController.tabController,
            tabs: personalController.listTabItem,
          ),
          Expanded(
            child: TabBarView(
              controller: personalController.tabController,
              children: personalController.listTab,
            ),
          ),
        ],
      ),
    );
  }
}
