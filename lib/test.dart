// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:noteappauth/screens/home_page.dart';
// import 'package:noteappauth/screens/log-in-email-pass.dart';
//
// class SignUpEmail extends StatefulWidget {
//   const SignUpEmail({Key? key}) : super(key: key);
//
//   @override
//   _SignUpEmailState createState() => _SignUpEmailState();
// }
//
// class _SignUpEmailState extends State<SignUpEmail> {
//   var myusername, mypassword, myemail;
//
//   SingUp() async {
//     var formdata = formstate.currentState;
//     if (formdata!.validate()) {
//       formdata.save();
//       try {
//         final credential =
//         await FirebaseAuth.instance.createUserWithEmailAndPassword(
//           email: myemail,
//           password: mypassword,
//         );
//         final user = credential.user;
//         await FirebaseAuth.instance.setLanguageCode("he");
//         await user?.sendEmailVerification();
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (BuildContext context) => HomePage(),
//           ),
//         );
//       } on FirebaseAuthException catch (e) {
//         if (e.code == 'weak-password') {
//           AwesomeDialog(
//             context: context,
//             title: "Error",
//             body: Text("Password is too weak"),
//           ).show();
//           print('The password provided is too weak.');
//         } else if (e.code == 'email-already-in-use') {
//           AwesomeDialog(
//             context: context,
//             title: "Error",
//             body: Text("The account already exists for that email."),
//           ).show();
//           print('The account already exists for that email.');
//         }
//       } catch (e) {
//         print(e);
//       }
//     } else {
//       print("Not Valid");
//     }
//   }
//
//   final GlobalKey<FormState> formstate = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(
//         children: [
//           SizedBox(
//             height: 100.0,
//           ),
//           Center(
//             child: FlutterLogo(
//               size: 120.0,
//             ),
//           ),
//           SizedBox(
//             height: 120.0,
//           ),
//           Container(
//             padding: EdgeInsets.all(20),
//             child: Form(
//                 key: formstate,
//                 child: Column(
//                   children: [
//                     Container(
//                       decoration: BoxDecoration(
//                         border: Border.all(
//                           color: Colors.red,
//                           width: 1.0,
//                         ),
//                         borderRadius: BorderRadius.circular(10.0),
//                       ),
//                       child: TextFormField(
//                         onSaved: (val) {
//                           myusername = val!;
//                         },
//                         validator: (val) {
//                           if (val!.length > 60)
//                             return "username can't to be larger than 60 letter !";
//                           if (val.length < 5)
//                             return "username can't to be less than 5 letter !";
//                           return null;
//                         },
//                         decoration: InputDecoration(
//                           icon: Icon(
//                             Icons.person,
//                             color: Colors.black,
//                           ),
//                           hintText: 'Enter your name',
//                           contentPadding:
//                           EdgeInsets.symmetric(
//                               vertical: 15.0, horizontal: 10.0),
//                           border: InputBorder.none,
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20.0,
//                     ),
//                     Container(
//                       decoration: BoxDecoration(
//                         border: Border.all(
//                           color: Colors.red,
//                           width: 12.0,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 20,),
//                     ElevatedButton(
//                       onPressed: () {
//                         SingUp();
//                         Navigator.pushReplacement(context, MaterialPageRoute(
//                             builder: (context) => HomePage()));
//                       },
//                       child: Text('Sign Up', style: TextStyle(
//                           fontSize: 20, fontWeight: FontWeight.bold),),
//                       style: ElevatedButton.styleFrom(
//                         primary: Colors.blue,
//                         padding: EdgeInsets.symmetric(
//                             horizontal: 30, vertical: 10),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(15),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 10,),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text('Already have an account?',
//                           style: TextStyle(fontSize: 16),),
//                         SizedBox(width: 5,),
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.pushReplacement(
//                                 context, MaterialPageRoute(
//                                 builder: (context) => LogInEmail()));
//                           },
//                           child: Text('Log In', style: TextStyle(fontSize: 18,
//                               color: Colors.blue,
//                               fontWeight: FontWeight.bold),),
//                         ),
//                       ],
//                     ),
//                   ],
//                 )
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }