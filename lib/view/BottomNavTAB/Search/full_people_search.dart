import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navsocial/view/FullPost/OtherPeople/other_people_personal.dart';

import 'Widget/people_search_widget.dart';

class FullPeopleSearchPage extends StatelessWidget {
  const FullPeopleSearchPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search",style: TextStyle(color: Colors.black),),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded,color: Colors.black,),
          onPressed: () {
            Get.back();
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(

        padding: EdgeInsets.symmetric(vertical: 10),
        child: ListView.separated(
          shrinkWrap: true,
          physics: AlwaysScrollableScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) {
            return InkWell(child: PeopleSearch(),onTap: ()=> Get.to(()=>OtherPeoplePersonalPage()),);
          },
          separatorBuilder: (context, index) {
            return Divider(
              thickness: 1.5,
              indent: 10,
              endIndent: 10,
            );
          },
        ),
      ),
    );
  }
}
