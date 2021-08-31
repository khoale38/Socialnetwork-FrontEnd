import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navsocial/view/FullPost/Display/main_media.dart';
import 'package:navsocial/view/FullPost/Single/full_post_media.dart';
import 'package:navsocial/view/FullPost/Single/comment_widget.dart';

class NewFeedPage extends StatelessWidget {
  const NewFeedPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_box_outlined),
        backgroundColor: CupertinoColors.systemYellow,
        foregroundColor: CupertinoColors.black,
        elevation: 0,
        onPressed: ()=> Get.toNamed('/newpost'),
        shape: StadiumBorder(side: BorderSide(color: CupertinoColors.black ,width: 5)),
      ),
      body: ListView.separated(

        shrinkWrap: true,
        physics: AlwaysScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (context, index) {
          return Card(child: GestureDetector(child: MainMedia(),onTap: ()=>Get.to(()=>FullPostMediaPage()),),elevation: 5,);
        },
        separatorBuilder: (context, index) {
          return Divider(
            thickness: 1.5,
            indent: 10,
            endIndent: 10,
          );
        },
      ),

    );
  }
}
