import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navsocial/constants/controller.dart';
import 'package:shimmer/shimmer.dart';

class OtherPeoplePersonalPage extends StatelessWidget {
  const OtherPeoplePersonalPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Name",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.black,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://static.remove.bg/remove-bg-web/3661dd45c31a4ff23941855a7e4cedbbf6973643/assets/start-0e837dcc57769db2306d8d659f53555feb500b3c5d456879b9c843d1872e7baa.jpg' ??
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
                    padding: EdgeInsets.only(left: 10, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          "Nick Name",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        0 == 1 //dummy testing
                            ? OutlinedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  onPrimary: Colors.grey,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(3),
                                      side: BorderSide(
                                          color: Colors.grey, width: 1)),
                                ),
                                onPressed: () {},
                                icon: Icon(Icons.account_circle,
                                    color: Colors.grey, size: 20),
                                label: Text(
                                  'Following',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                              )
                            : OutlinedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.blue,
                                  onPrimary: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(3),
                                      side: BorderSide(
                                          color: Colors.grey, width: 1)),
                                ),
                                onPressed: () {},
                                icon: Icon(Icons.visibility,
                                    color: Colors.white, size: 20),
                                label: Text(
                                  'Follow',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                              )
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
                    width: 3.0, style: BorderStyle.solid, color: Colors.grey),
                insets: EdgeInsets.symmetric(horizontal: size.width * 0.3),
              ),
              controller: otherPeoplePersonalController.tabController,
              tabs: otherPeoplePersonalController.listTabItem,
            ),
            Expanded(
              child: TabBarView(
                controller: otherPeoplePersonalController.tabController,
                children: otherPeoplePersonalController.listTab,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
