import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:navsocial/constants/controller.dart';


class LoginButton extends StatelessWidget {
  const LoginButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: height*0.65),
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.all(50),
          child: Column(
            children: [ElevatedButton.icon(
              style: ElevatedButton.styleFrom(primary: Colors.yellow,shape:  RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                  side: BorderSide(color: Colors.black,width: 2)
              ),),
              icon:FaIcon(FontAwesomeIcons.google, color: Colors.black,),
              label: Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  "Login with Google",
                  style: TextStyle(fontSize: 24,color: Colors.black),
                ),
              ),
              onPressed: () {authController.google_signIn();},
            ),
              Expanded(child: Align(alignment: Alignment.bottomCenter,child: Text("Contact IG:@MikaaaSS",style: TextStyle(decoration: TextDecoration.none,fontFamily: 'Roboto',fontSize: 16, color: Colors.yellow))))
            ],
          ),
        ),
      ),
    );
  }
}
