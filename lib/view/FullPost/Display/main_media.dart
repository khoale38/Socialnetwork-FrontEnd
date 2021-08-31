import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:navsocial/constants/controller.dart';

class MainMedia extends StatelessWidget {
  const MainMedia({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(children: [
      Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage:
                  NetworkImage(authController.auth.currentUser.photoURL),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              authController.auth.currentUser.displayName != null
                  ? authController.auth.currentUser.displayName
                  : "Nick Name",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
        padding: EdgeInsets.only(top: 10, bottom: 3, right: 15, left: 15),
        child: Row(
          children: [
            LikeButton(
              circleColor:
                  CircleColor(start: Colors.pinkAccent, end: Colors.pinkAccent),
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
    ]);
  }
}
