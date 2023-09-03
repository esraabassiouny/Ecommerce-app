import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import 'Items/color_item.dart';
import 'Widgets/signin_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _passwordTextController=TextEditingController();
  TextEditingController _emilTextController=TextEditingController();
  TextEditingController _userNameTextController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(gradient: LinearGradient(
          colors:[
            hexaStringToColor("9370DB"),
            Colors.deepPurple
          ],begin: Alignment.topCenter,end: Alignment.bottomCenter)),
          child: SingleChildScrollView(
          child: Padding(
          padding: const EdgeInsets.fromLTRB(
          20,
          125,
          20,
          0),

           child: Column(
          children: <Widget>[
            const SizedBox(
              height: 130,
            ),
            reusableTextField("Enter UserName", Icons.person_outline, false, _userNameTextController),

            const SizedBox(
              height: 30,
            ),
            reusableTextField("Enter your Email", Icons.person_outline, false, _emilTextController),
            const SizedBox(
              height: 30,
            ),
            reusableTextField("Enter your Password", Icons.lock_outline, true, _passwordTextController),
              const SizedBox(
                  height: 30,
              ),
            signInSignUpButton(context, false, () {
             // FirebaseAuth.instance
               //   .createUserWithEmailAndPassword(
                 //     email: _emilTextController.text,
                   //   password: _passwordTextController.text)
                  //.then((value) {
                   // print("Created New Account");
                    //Navigator.push(context,
                      //  MaterialPageRoute(builder: (context)=>const MainScreen()));
              //}).onError((error, stackTrace) {
                //print("Error ${error.toString()}");
              //});
            })
          ],
    )))

      ),
    );
  }
}
