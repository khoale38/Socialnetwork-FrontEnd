import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:navsocial/constants/controller.dart';
import 'package:navsocial/view/BottomNavTAB/Search/Widget/people_search_widget.dart';
import 'package:navsocial/view/BottomNavTAB/Search/Widget/recent_media_search_widget.dart';
import 'package:navsocial/view/BottomNavTAB/Search/full_people_search.dart';
import 'package:navsocial/view/FullPost/OtherPeople/other_people_personal.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => searchWidgetState();
}

class searchWidgetState extends State<SearchPage>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController animationController;
  bool isforward = false;
  Rx<bool> isSearch = false.obs;
  Tween<double> tween;
  FocusNode _focusNode = new FocusNode();

  @override
  void initState() {
    super.initState();
    searchController.textController.addListener(() {
      if (_focusNode.hasFocus)
        isSearch.value = true;
      else
        isSearch.value = false;
    });
    animationController =
        AnimationController(vsync: (this), duration: Duration(seconds: 1));

    final curvedAnimation =
        CurvedAnimation(parent: animationController, curve: Curves.easeOutExpo);

    tween = Tween<double>(begin: 0, end: 150);

    animation = tween.animate(curvedAnimation)
      ..addListener(() {
        setState(() {});
      });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // executes after build
      Future.delayed(Duration(milliseconds: 200)).then((value) {
        animationController.forward();
        isforward = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    tween.end = size.width - size.width * 0.3;
    Rx<String> searchText = ''.obs;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  width: size.width,
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: EdgeInsets.all(size.width * 0.01),
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2),
                        borderRadius: BorderRadius.circular(10),
                        color: CupertinoColors.systemYellow,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                              left: size.width * 0.04,
                            ),
                            width: animation.value,
                            child: TextField(
                              focusNode: _focusNode,
                              onChanged: (String value) {
                                searchText.value = value;
                              },
                              autofocus: false,
                              controller: searchController.textController,
                              cursorColor: Colors.black,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                            ),
                          ),
                          Obx(
                            () => IconButton(
                              hoverColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              icon: searchText.value.length == 0
                                  ? Icon(
                                      Icons.search,
                                      color: Colors.black,
                                    )
                                  : Icon(
                                      Icons.clear,
                                      color: Colors.black,
                                    ),
                              onPressed: () {
                                searchController.textController.clear();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  elevation: 8,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            left: 10, right: 10, top: 10, bottom: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "People",
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                            InkWell(
                              child: Text(
                                "See More",
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                              onTap: () {
                                Get.to(FullPeopleSearchPage());
                              },
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 15),
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return GestureDetector(child: PeopleSearch(),onTap:()=> Get.to(()=>OtherPeoplePersonalPage()),);
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
                    ],
                  ),
                ),
                Card(
                  elevation: 8,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            left: 10, right: 10, top: 10, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Recent Media",
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                      ),

                      //this height cannot be fix this is a temp solution to fix 3 items
                      ListView.separated(

                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Card(child: RecentMedia(),elevation: 5,);
                        },
                        separatorBuilder: (context, index) {
                          return Divider(
                            thickness: 1.5,
                            indent: 10,
                            endIndent: 10,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
