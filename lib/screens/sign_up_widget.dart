import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:noteappauth/screens/Sign-up-email-pass.dart';
import 'package:noteappauth/screens/registrationEmail.dart';
import 'package:noteappauth/screens/home_page.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../test.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({Key? key}) : super(key: key);


  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();

}

class _SignUpWidgetState extends State<SignUpWidget> {

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          FlutterLogo(size: 120.0,),
          SizedBox(height: 35.0,),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Hey There,\nWelcome Backe",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                decoration: TextDecoration.none,
              ),
            ),
          ),
          SizedBox(height: 8,),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Login to your account to continue",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                decoration: TextDecoration.none,
              ),
            ),
          ),
          Spacer(),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              onPrimary: Colors.black,
              minimumSize: Size(double.infinity , 50),
            ),
            icon: FaIcon(
              FontAwesomeIcons.userNinja,
              color: Colors.red,
            ),
            onPressed: ()async{
              try {
                final userCredential =
                    await FirebaseAuth.instance.signInAnonymously();
                print("Signed in with temporary account.");
              } on FirebaseAuthException catch (e) {
                switch (e.code) {
                  case "operation-not-allowed":
                    print("Anonymous auth hasn't been enabled for this project.");
                    break;
                  default:
                    print("Unknown error.");
                }
              }
            },
            label: Text("Anonymous guest"),
          ),
          SizedBox(height: 15.0,),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              onPrimary: Colors.black,
              minimumSize: Size(double.infinity , 50),
            ),
            icon: FaIcon(
              FontAwesomeIcons.google,
              color: Colors.red,
            ),
            onPressed: ()async{
              var user =await signInWithGoogle();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
              print("True");
              print(user.credential?.token);
              // final provider =
              // Provider.of<GoogleSignInProvider>(context,listen: false);
              // provider.googleLogin();
            },
            label: Text("Sing Up with Gogole "),
          ),
          SizedBox(height: 15.0,),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              onPrimary: Colors.black,
              minimumSize: Size(double.infinity , 50),
            ),
            icon: FaIcon(
              // FontAwesomeIcons.mailchimp,
              // FontAwesomeIcons.pushed,
              FontAwesomeIcons.envelope,
              color: Colors.red,
            ),
            onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpEmail()));
              // try {
              //   String? emailAddress="Xnxx@sex.com";
              //   String? password ="5sg4dh65g";
              //   final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
              //     email: emailAddress,
              //     password: password,
              //   );
              // } on FirebaseAuthException catch (e) {
              //   if (e.code == 'weak-password') {
              //     print('The password provided is too weak.');
              //   } else if (e.code == 'email-already-in-use') {
              //     print('The account already exists for that email.');
              //   }
              // } catch (e) {
              //   print(e);
              // }
            },
            label: Text("  Sing Up with Email"),
          ),
          SizedBox(height: 40,),
          RichText(
            text: TextSpan(
              text: "Already have an account ? ",
              children: [
                TextSpan(
                  text: "Log in",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ],
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
