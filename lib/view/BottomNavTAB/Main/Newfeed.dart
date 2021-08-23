import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        onPressed: (){},
        shape: StadiumBorder(side: BorderSide(color: CupertinoColors.black ,width: 5)),
      ),

    );
  }
}
