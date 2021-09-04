import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';
import 'package:navsocial/constants/controller.dart';
import 'package:navsocial/view/FullPost/Single/comment_widget.dart';

class FullPostMediaPage extends StatelessWidget {
  const FullPostMediaPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: ()=>FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            elevation: 0,
            hoverElevation: 0,
            focusElevation: 0,
            highlightElevation: 0,
            onPressed: () {
              fullPostController.scrollUp();
            },
            child: Icon(Icons.arrow_upward_sharp),
            backgroundColor: Colors.grey.withOpacity(0.6),
          ),
          appBar: AppBar(
            elevation: 5,
            backgroundColor: Colors.white,
            leading: Container(
              width: 25,
              height: 25,
              padding: EdgeInsets.all(5),
              child: Ink(
                decoration: ShapeDecoration(
                  color: Colors.white.withOpacity(0.3),
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  splashRadius: 25,
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            controller: fullPostController.controller,
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(
                            authController.auth.currentUser.photoURL),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            authController.auth.currentUser.displayName != null
                                ? authController.auth.currentUser.displayName
                                : "Nick Name",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            "Today at 16pm",
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Image(
                  height: size.height * 0.6,
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://static.remove.bg/remove-bg-web/3661dd45c31a4ff23941855a7e4cedbbf6973643/assets/start-0e837dcc57769db2306d8d659f53555feb500b3c5d456879b9c843d1872e7baa.jpg'),
                ),
                Container(
                    padding: EdgeInsets.only(top: 8, left: 5,right:5),
                    child: RichText(
                      text: new TextSpan(
                        // Note: Styles for TextSpans must be explicitly defined.
                        // Child text spans will inherit styles from parent
                        style: new TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          new TextSpan(
                              text: authController.auth.currentUser.displayName + ": ",
                              style: new TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          new TextSpan(text: 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. ut '),
                        ],
                      ),
                    )),
                Container(
                  padding:
                      EdgeInsets.only(top: 10, bottom: 3, right: 15, left: 15),
                  child: Row(
                    children: [
                      LikeButton(
                        circleColor: CircleColor(
                            start: Colors.pinkAccent, end: Colors.pinkAccent),
                        bubblesColor: BubblesColor(
                          dotPrimaryColor: Colors.pinkAccent,
                          dotSecondaryColor: Colors.pinkAccent,
                        ),
                        likeBuilder: (bool isLiked) {
                          return Icon(
                            Icons.favorite,
                            size: 30,
                            color: isLiked ? Colors.pinkAccent : Colors.grey,
                          );
                        },
                        likeCount: 999,
                        countBuilder: (int count, bool isLiked, String text) {
                          var color = isLiked ? Colors.pinkAccent : Colors.grey;
                          Widget result;
                          if (count == 0) {
                            result = Text(
                              text,
                              style: TextStyle(color: color),
                            );
                          } else
                            result = Text(
                              text,
                              style: TextStyle(color: color),
                            );
                          return result;
                        },
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.comment,
                        color: Colors.grey,
                        size: 30,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "999",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Card(
                  elevation: 5,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Row(
                      children: [
                        Expanded(
                            child: TextField(
                              maxLength: 150,
                              maxLines: null,
                              keyboardType: TextInputType.multiline,
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 5)),
                        )),
                        Container(
                            margin: EdgeInsets.only(left: 10),
                            child: InkWell(onTap: (){},
                              child: Text(
                                "Send",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
                Card(
                    elevation: 10,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return CommentWidget();
                      },
                    ))
              ],
            ),
          )),
    );
  }
}
