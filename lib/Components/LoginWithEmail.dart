import 'package:app/Components/ChatList.dart';
import 'package:app/Components/ForgotPassword.dart';
import 'package:app/Components/LoginWithGoogle.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:app/Components/UiHelper.dart';
import 'package:app/Components/Signup.dart';
import 'package:app/Components/checkUser.dart';

class LoginWithEmail extends StatefulWidget {
  const LoginWithEmail({super.key});

  @override
  State<LoginWithEmail> createState() => _LoginWithEmail();
}

class _LoginWithEmail extends State<LoginWithEmail> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // TextEditingController nameController = TextEditingController();

  login(String email, String password) async {
    if (email == "" && password == "") {
      return Uihelper.CustomAlertBox(context, "Enter Required Fields");
    } else {
      UserCredential? userCredential;
      try {
        userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        Uihelper.CustomAlertBox(context, "Login Successfull");
        Future.delayed(const Duration(seconds: 1), () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => ChatScreen()),
            (Route<dynamic> route) => false,
          );
        });
      } on FirebaseAuthException catch (ex) {
        return Uihelper.CustomAlertBox(context, ex.code.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SIGN IN'), centerTitle: true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Uihelper.CustomTextField(
            emailController,
            "Enter your Email",
            Icons.mail,
            false,
          ),
          Uihelper.CustomTextField(
            passwordController,
            "Enter Password",
            Icons.password,
            true,
          ),
          SizedBox(height: 30),
          Uihelper.Custombutton(
            () {
              login(
                emailController.text.toString(),
                passwordController.text.toString(),
              );
            },
            "SIGN IN",
            Colors.purple,
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Create An Account.", style: TextStyle(fontSize: 20)),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpPage()),
                  );
                },
                child: Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPassword()));
            },
            child: Text("Forgot Password", style: TextStyle(fontSize: 20)),
          ),

          Divider(height: 30),
          LoginWithGoogle(),
        ],
      ),
    );
  }
}
