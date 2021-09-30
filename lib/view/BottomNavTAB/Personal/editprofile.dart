import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navsocial/constants/controller.dart';
import 'package:navsocial/view/BottomNavTAB/Personal/Widget/editprofile_widget.dart';
import 'package:shimmer/shimmer.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 5,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.black,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          actions: [
            IconButton(
                onPressed: () => {},
                icon: Icon(
                  Icons.logout,
                  color: Colors.black,
                ))
          ],
        ),
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 15),
          child: Column(
            children: [
              GestureDetector(
                onTap: () => Get.toNamed('/updateinfo', arguments: [
                  "Avatar",
                  0,
                  'https://static.remove.bg/remove-bg-web/3661dd45c31a4ff23941855a7e4cedbbf6973643/assets/start-0e837dcc57769db2306d8d659f53555feb500b3c5d456879b9c843d1872e7baa.jpg'
                ]), //value need to change later
                child: Center(
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://static.remove.bg/remove-bg-web/3661dd45c31a4ff23941855a7e4cedbbf6973643/assets/start-0e837dcc57769db2306d8d659f53555feb500b3c5d456879b9c843d1872e7baa.jpg' ??
                            "https://www.google.com/",
                    imageBuilder: (context, imageProvider) => CircleAvatar(
                      radius: 75,
                      backgroundImage: imageProvider,
                    ),
                    errorWidget: (context, url, error) => CircleAvatar(
                      radius: 75,
                      backgroundImage: AssetImage("assets/logo/logo.png"),
                    ),
                    placeholder: (context, url) => Shimmer.fromColors(
                      child: CircleAvatar(
                        radius: 75,
                        backgroundColor: Colors.black,
                      ),
                      baseColor: Colors.grey,
                      highlightColor: Colors.grey[100],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              AutoSizeText(
                "UID : uid",
                style: TextStyle(fontWeight: FontWeight.bold),
                minFontSize: 18,
                maxLines: 1,
              ),
              SizedBox(height: 10),
              Text(
                "Nick Name",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              EditProfileWidget(
                title: "Name",
                value: "displayName", //TODO:temp
                widget: Text("displayName", //TODO:temp
                    style: TextStyle(
                        fontSize: 18,
                        color: Color(0xff999999),
                        fontWeight: FontWeight.bold)),
                function: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
