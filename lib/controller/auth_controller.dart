import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:navsocial/view/Login.dart';
import 'package:navsocial/view/Home.dart';

class AuthController extends GetxController
{
  static AuthController instance = Get.find();
  FirebaseAuth auth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn =GoogleSignIn(scopes: ['email']);


  void google_signIn() async{

    final GoogleSignInAccount googleUser = await googleSignIn.signIn();  //calling signIn method // this will open a dialog pop where user can select his email id to signin to the app

    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,                                           //create a login credential
        accessToken: googleAuth.accessToken
    );
    //won't work if used get.ofallname ¯\_(ツ)_/¯
    final User user = (await auth.signInWithCredential(credential).then((value) => Get.offAll(HomePage())));  //if credential success, then using _auth signed in user data will be stored

  }

  void google_signOut() async{
    await googleSignIn.signOut().then((value) => Get.offAll(LoginPage()));
  }


}
