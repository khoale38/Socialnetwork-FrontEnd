import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:navsocial/constants/controller.dart';

class CommentWidget extends StatelessWidget {
  const CommentWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Card(
        elevation: 15,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(

              padding: EdgeInsets.symmetric(vertical: 3, horizontal: 3),
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 33,
                    backgroundImage:
                        NetworkImage(authController.auth.currentUser.photoURL),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: AutoSizeText(
                      "08/09/2021",
                      maxFontSize: 13,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 8),
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
                          style: TextStyle(color: color, fontSize: 16),
                        );
                      } else
                        result = Text(
                          text,
                          style: TextStyle(color: color, fontSize: 16),
                        );
                      return result;
                    },
                  ),
                ],
              ),
            ),

            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 3, horizontal: 3),
                margin: EdgeInsets.only(top: 5,bottom: 5,right: 5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    AutoSizeText(
                      authController.auth.currentUser.displayName != null
                          ? authController.auth.currentUser.displayName
                          : "Nick Name",
                      textAlign: TextAlign.start,
                      style: TextStyle(fontWeight: FontWeight.bold),
                      minFontSize: 18,
                    ),
                    SizedBox(height: 8),
                    AutoSizeText(
                      "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc. ",
                      minFontSize: 14,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
