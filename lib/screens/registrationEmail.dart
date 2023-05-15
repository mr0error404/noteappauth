import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:noteappauth/screens/home_page.dart';
import 'package:noteappauth/screens/log-in-email-pass.dart';

class SignUpEmail extends StatelessWidget {
  // var myusername, mypassword, myemail;
  // const SignUpEmail({Key? key}) : super(key: key);

  // SingUp()async{
  //   var formdata = formstate.currentState;
  //   if(formdata!.validate()){
  //     formdata.save();
  //     final user = FirebaseAuth.instance.currentUser;
  //     try {
  //       final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //         email: myusername,
  //         password: mypassword,
  //       );
  //     } on FirebaseAuthException catch (e) {
  //       if (e.code == 'weak-password') {
  //         // AwesomeDialog(
  //         //     context:context,
  //         //     title: "Error",
  //         //     body: Text("Password is to weak")
  //         // );
  //         // )..show();
  //         print('The password provided is too weak.');
  //       } else if (e.code == 'email-already-in-use') {
  //         // AwesomeDialog(
  //         //     context:,
  //         //     title: "Error",
  //         //     body: Text("The account already exists for that email.")
  //         // )..show();
  //         // )..show();
  //         print('The account already exists for that email.');
  //       }
  //     } catch (e) {
  //
  //       print(e);
  //     }
  //     await FirebaseAuth.instance.setLanguageCode("he");
  //     await user?.sendEmailVerification();
  //     print("Valid");
  //   }else{
  //     print("Not Valid");
  //   }
  // }
  GlobalKey<FormState> formstate= GlobalKey<FormState>();
  @override

  Widget build(BuildContext context) {
    TextEditingController _emailAddress = TextEditingController();
    TextEditingController _password = TextEditingController();
    TextEditingController _username = TextEditingController();
    // String _email='',_password='',_username='';
    // GlobalKey<FormState> formstate = GlobalKey<FormState>();
    // final TextEditingController _usernameController = TextEditingController();
    // final TextEditingController _emailController = TextEditingController();
    // final TextEditingController _passwordController = TextEditingController();
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('SignUp Email \\ Passs'),
      // ), TextEditingController _password = TextEditingController();
      // T
      body: ListView(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height:100.0,),
          Center(
            child: FlutterLogo(size: 120.0,),
          ),
          SizedBox(height: 120.0,),
          // FaIcon(
          //   size: 200,
          //   FontAwesomeIcons.envelope,
          //   color: Colors.red,
          // ),
          // SizedBox(height: 80,),
          Container(
            padding: EdgeInsets.all(20),
            child: Form(
              key: formstate,
              child: Column(
                children: [
                  Container(
                    // margin: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.red,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: TextFormField(
                      // onSaved: (val){
                      //   myusername=val!;
                      // },
                      // validator: (val){
                      //   if(val!.length > 60)
                      //     return "username can't to be larger than 60 letter !";
                      //   if(val!.length < 5)
                      //     return "username can't to be less than 5 letter !";
                      //   return null;
                      // },
                      controller: _username,
                      decoration: InputDecoration(
                        icon: Icon(Icons.person,color: Colors.black,),
                        hintText: 'Enter your name',
                        contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Container(
                    // margin: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.red,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: TextFormField(
                      // onSaved: (val){
                      //   myemail=val!;
                      // },
                      // validator: (val){
                      //   if(val!.length > 60)
                      //     return "Email can't to be larger than 60 letter !";
                      //   if(val!.length < 5)
                      //     return "Email can't to be less than 5 letter !";
                      //   return null;
                      // },
                      controller: _emailAddress,
                      decoration: InputDecoration(
                        icon: Icon(Icons.person,color: Colors.black,),
                        hintText: 'Enter your Email',
                        contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    // margin: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.red,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: TextFormField(
                      // onSaved: (val){
                      //   mypassword=val!;
                      // },
                      // validator: (val){
                      //   if(val!.length > 60)
                      //     return "Passeord can't to be larger than 60 letter !";
                      //   if(val!.length < 5)
                      //     return "Password can't to be less than 5 letter !";
                      //   return null;
                      // },
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
                    children: [
                      Text(
                        "If your have Account",
                      ),
                      TextButton(onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LogInEmail()),
                        );
                      },
                        child: Text("Click Here  "),
                      ),
                    ],
                  ),
                  TextButton(
                    child: Text("Sign Up"),
                    onPressed: ()async{
                      final user = FirebaseAuth.instance.currentUser;
                      try {
                        final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                          email: _emailAddress.text,
                          password: _password.text,
                        );
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          print('The password provided is too weak.');
                        } else if (e.code == 'email-already-in-use') {
                          print('The account already exists for that email.');
                        }
                        await FirebaseAuth.instance.setLanguageCode("ar");
                        await user?.sendEmailVerification();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LogInEmail(),
                          ),
                        );

                      } catch (e) {
                        print(e);
                      }
                      // var response =  await SingUp();
                      // if(response != null){
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(builder: (context) => LogInEmail(),
                      //     ),
                      //   );
                        print("TTTTTRUE");
                      }
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => LogInEmail(),
                      //   ),
                      // );
                      // print("turr");
                      // print(credential.)
                    // },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
