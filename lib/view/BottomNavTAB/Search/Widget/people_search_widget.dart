import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navsocial/constants/controller.dart';

class PeopleSearch extends StatelessWidget {
  const PeopleSearch({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
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
    );
  }
}
