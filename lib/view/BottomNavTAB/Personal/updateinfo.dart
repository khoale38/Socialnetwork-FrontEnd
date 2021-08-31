import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navsocial/constants/controller.dart';
import 'package:shimmer/shimmer.dart';

class UpdateInfoPages extends StatelessWidget {
  const UpdateInfoPages({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var param = Get.arguments;
    final controller = TextEditingController();

    Widget input(int type,String value)
    {
      switch(type)
      {
        case 0:
          return Padding(
            padding: EdgeInsets.only(top: 10),
            child: InkWell(
              onTap: () {
                updateInfoController.getImage();
              },
              child: CachedNetworkImage(
                imageUrl: authController.auth.currentUser.photoURL ??
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
          );
        default:
          controller.text = value;
          return TextField(
            controller: controller,
            style: TextStyle(fontSize: 20),
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: param[0],
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.all(20)),
          );

      }


    }


    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          param[0].toString(),
          style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold),
        ),
        leading: Container(
          width: 25,
          height: 25,
          padding: EdgeInsets.all(5),
          child: Ink(
            decoration: ShapeDecoration(
              color: Colors.white.withOpacity(0.2),
              shape: CircleBorder(),
            ),
            child: IconButton(
              splashRadius: 25,
              icon: Icon(
                Icons.arrow_back,
                color: Color(0xFF363638),
              ),
              onPressed: () {
                Get.back();
              },
            ),
          ),
        ),
      ),
      body: Container(
        color: Color(0xffF2F2F2),
        child: Column(
          children: [
            input(param[1], param[2]),
            Container(
                width: double.infinity,
                margin: EdgeInsets.all(10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black87),
                    onPressed: () async {
                    //this have to be multi options for diffences widget
                      Get.back();
                    },
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "Done",
                        style: TextStyle(fontSize: 24),
                      ),
                    )))
          ],
        ),
      ),
    );
  }
}
