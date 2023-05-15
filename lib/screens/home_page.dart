import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'sign_up_widget.dart';

class HomePage extends StatelessWidget {
  // const HomePage({Key? key}) : super(key: key);
  var user = FirebaseAuth.instance.currentUser;

  getUser(){
    var user = FirebaseAuth.instance.currentUser;
    print(user?.displayName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context , snapshot){
            if (snapshot.connectionState == ConnectionState.waiting) { // no nnection
              return Center(child: CircularProgressIndicator(),);//
            // }else if(snapshot.hasData){
            //   return LoggedInWidget();
            }else if(snapshot.hasData){
              return Scaffold(
                appBar: AppBar(
                  title: Text("Good joob"),
                  // leading: IconButton( // backButton()
                  //   icon: Icon(Icons.arrow_back),
                  //   onPressed: () {
                  //     Navigator.of(context).pop();
                  //   },
                  // ),
                  actions: [
                    IconButton(
                        onPressed: ()async{ // signOut()
                          await FirebaseAuth.instance.signOut();
                        },
                        // icon: FaIcon(
                        //   FontAwesomeIcons.arrowRightFromBracket,
                        //   color: Colors.white,
                        // ),
                      icon: Icon(Icons.exit_to_app),
                    ),
                  ],
                ),
                body: Center(
                  child: ElevatedButton.icon(onPressed: (){
                    print(getUser());
                    print(user?.uid);
                    print(user?.phoneNumber);
                    print(user?.photoURL);
                    print(user?.email);
                    print(user?.refreshToken);
                  }, icon: Icon(Icons.print), label: Text("Print")),
                ),
                // body: Center(
                //   child: Text(getUser(),style: TextStyle(color: Colors.black,fontSize: 35.0 ,fontWeight: FontWeight.bold),),
                // ),
              );
            }else if(snapshot.hasError){
              return Center(child: Text("Something Went Worng ! "),);
            }else{
              return SignUpWidget();
            }
          }
      ),
    );
  }
}
