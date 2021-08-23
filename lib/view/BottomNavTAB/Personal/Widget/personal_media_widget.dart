import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:navsocial/constants/controller.dart';
import 'package:navsocial/view/FullPost/Single/full_post_media.dart';

class PersonalMedia extends StatelessWidget {
  const PersonalMedia({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Container(
        color: Colors.transparent,
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [ 0==1 ? //dummy testing here
            GridView.builder(
                itemCount: 15,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 5),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 25,
                  crossAxisSpacing: 15,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Get.to(FullPostMediaPage()),
                    child: Image(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://images.hdqwalls.com/wallpapers/forever-7th-capital-anime-4k-4x.jpg'),
                    ),
                  );
                })
            : SpinKitWave(color: Colors.grey,size: 45,)
          ],
        ),
      ),
    );
  }
}
