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
            backgroundImage: NetworkImage(
                'https://static.remove.bg/remove-bg-web/3661dd45c31a4ff23941855a7e4cedbbf6973643/assets/start-0e837dcc57769db2306d8d659f53555feb500b3c5d456879b9c843d1872e7baa.jpg'),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            "Nick Name",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
