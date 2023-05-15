import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class LogInEmail extends StatelessWidget {
  const LogInEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _email = TextEditingController();
    TextEditingController _password = TextEditingController();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.red,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: TextFormField(
              controller: _email,
              decoration: InputDecoration(
                icon: Icon(Icons.person,
                  color: Colors.black,
                ),
                hintText: 'Enter your Email',
                contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.red,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: TextFormField(
              controller: _password,
              decoration: InputDecoration(
                icon: Icon(Icons.key,
                  color: Colors.black,

                ),
                hintText: 'Enter your Password',
                contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                border: InputBorder.none,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("dgfhg"),
              TextButton(onPressed: (){}, child: Text("SignUp"),),
            ],
          ),
          IconButton(onPressed: ()async{
            try {
              final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                  email: _email.text,
                  password: _password.text,
              );
            } on FirebaseAuthException catch (e) {
              if (e.code == 'user-not-found') {
                print('No user found for that email.');
              } else if (e.code == 'wrong-password') {
                print('Wrong password provided for that user.');
              }
            }
            print("Ture");
            Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage(),
                  ),
                );
          }, icon: Icon(Icons.send),),
        ],
      ),
    );
  }
}
