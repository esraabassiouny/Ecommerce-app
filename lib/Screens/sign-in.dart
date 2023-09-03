import 'package:ecommerce/Screens/Items/color_item.dart';
import 'package:ecommerce/Screens/sign-up.dart';
import 'package:ecommerce/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Widgets/signin_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _passwordTextController=TextEditingController();
  TextEditingController _emilTextController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(gradient: LinearGradient(
              colors:[
               hexaStringToColor("9370DB"),
               //hexaStringToColor("8A2BE2"),
                Colors.deepPurple
              ],
            begin: Alignment.topCenter,end: Alignment.bottomCenter
          )),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
                20,
                125,
                20,
                0),

            child: Column(
              children: <Widget>[
                  logoWidget("assets/Images/avatar.png"),

                const SizedBox(
                  height: 60,

                ),
                reusableTextField("Enter UserName", Icons.person_outline, false, _emilTextController),

                const SizedBox(
                  height: 30,
                ),
                reusableTextField("Enter your Password", Icons.lock_outline, true, _passwordTextController),
                const SizedBox(
                  height: 30,
                ),
                signInSignUpButton(context, true, (){
                 //FirebaseAuth.instance.signInWithEmailAndPassword(
                //      email: _emilTextController.text,
              //       password: _passwordTextController.text).then((value) {
            //           Navigator.push(
          //                 context,
        //                    MaterialPageRoute(builder: (context)=>const MainScreen()));
      //            }
    //);
    }
    ),
                signUpOption()
              ],
            ),
          ),
        ),
      ),
    );
  }
  Row signUpOption (){
    return Row(
      mainAxisAlignment:MainAxisAlignment.center ,
      children: [
        const Text(
          "Don't have an account ? ",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white70
          ),
        ),
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
          },
          child:const Text(

            "Sign Up",
            style: TextStyle(
              fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
