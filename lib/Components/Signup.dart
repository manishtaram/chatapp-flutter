import 'package:app/Components/HomePage.dart';
import 'package:app/Components/LoginWithEmail.dart';
import 'package:app/Components/LoginWithGoogle.dart';
import 'package:app/Components/UiHelper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:app/Components/UiHelper.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  //   final _auth = FirebaseAuth.instance;

  final _fullnameController = TextEditingController();
  final _emailController = TextEditingController();
  // final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();

  signUp(
    String name,
    String email,
    String password,
    String confirmPassword,
  ) async {
    if (name == "" && email == "" && password == "" && confirmPassword == "") {
      Uihelper.CustomAlertBox(context, "Enter required fields");
    } 
    else {
      UserCredential? usercredential;

      if (password != confirmPassword) {
        Uihelper.CustomAlertBox(context, "Password do not match.");
      }
      try {
        usercredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginWithEmail()),
        );
      } on FirebaseAuthException catch (ex) {
        return Uihelper.CustomAlertBox(context, ex.code.toString());
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sing up'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "SIGN UP",
                style: TextStyle(
                  fontSize: 68,
                  fontWeight: .bold,
                  color: Colors.teal,
                ),
              ),
              SizedBox(height: 20),

              Uihelper.CustomTextField(
                _fullnameController,
                "Enter Full Name",
                Icons.person,
                false,
              ),
              Uihelper.CustomTextField(
                _emailController,
                "Enter Your Email",
                Icons.email,
                false,
              ),
              Uihelper.CustomTextField(
                _passwordController,
                "Enter Password",
                Icons.password,
                true,
              ),
              Uihelper.CustomTextField(
                _confirmController,
                "Enter Password",
                Icons.password,
                true,
              ),
              SizedBox(height: 30),

              Uihelper.Custombutton(
                () {
                  signUp(
                    _fullnameController.text.toString(),
                    _emailController.text.toString(),
                    _passwordController.text.toString(),
                    _confirmController.text.toString(),
                  );
                },
                "Sign Up",
                Colors.purple,
              ),
              // 1. below comment is here
              Divider(height: 40),
              // 2.
              LoginWithGoogle(),
            ],
          ),
        ),
      ),
    );
  }
}




//1.  TextField(
              //   controller: _usernameController,
              //   decoration: InputDecoration(labelText: "Enter Username"),
              // ),
              // TextField(
                
              //   controller: _emailController,
              //   decoration: InputDecoration(labelText: "Enter Email" ),
              // ),
              // TextField(
              //   controller: _phoneController,
              //   decoration: InputDecoration(labelText: "Enter Phone No"),
              // ),
              // TextField(
              //   controller: _passwordController,
              //   decoration: InputDecoration(labelText: "Enter Password"),
              //   obscureText: true,
              // ),
              // TextField(
              //   controller: _confirmController,
              //   decoration: InputDecoration(labelText: "Confirm Password"),
              //   obscureText: true,
              // ),

              // SizedBox(height: 20),
              // ElevatedButton(onPressed: _signUp, child: Text("Sign Up")),
//2. ElevatedButton.icon(
              //   onPressed: () {
              //     // TODO: Implement Google Sign-In
              //   },
              //   icon: Icon(Icons.login),
              //   label: Text("Sign Up with Google", style: TextStyle(color: Colors.white),),
              //   style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              // ),
