import 'package:app/Components/ChatList.dart';
import 'package:app/Components/ForgotPassword.dart';
import 'package:app/Components/LoginWithGoogle.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:app/Components/UiHelper.dart';
import 'package:app/Components/Signup.dart';

class LoginWithEmail extends StatefulWidget {
  const LoginWithEmail({super.key});

  @override
  State<LoginWithEmail> createState() => _LoginWithEmail();
}

class _LoginWithEmail extends State<LoginWithEmail> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // LOGIN FUNCTION
  login(String email, String password) async {
    // Apply trim here (BEST PRACTICE)
    email = email.trim();
    password = password.trim();

    if (email.isEmpty || password.isEmpty) {
      return Uihelper.CustomAlertBox(context, "Enter Required Fields");
    }

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      Uihelper.CustomAlertBox(context, "Login Successful");

      Future.delayed(const Duration(seconds: 1), () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => ChatScreen()),
          (Route<dynamic> route) => false,
        );
      });
    } on FirebaseAuthException catch (ex) {
      return Uihelper.CustomAlertBox(
        context,
        ex.message ?? "Login Failed",
      );
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SIGN IN'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Uihelper.CustomTextField(
              emailController,
              "Enter your Email",
              Icons.mail,
              false,
            ),
            const SizedBox(height: 15),
            Uihelper.CustomTextField(
              passwordController,
              "Enter Password",
              Icons.password,
              true,
            ),
            const SizedBox(height: 30),

            Uihelper.Custombutton(
              () {
                login(
                  emailController.text,
                  passwordController.text,
                );
              },
              "SIGN IN",
              Colors.purple,
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Create An Account.",
                  style: TextStyle(fontSize: 18),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpPage(),
                      ),
                    );
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),

            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ForgotPassword(),
                  ),
                );
              },
              child: const Text(
                "Forgot Password",
                style: TextStyle(fontSize: 18),
              ),
            ),

            const Divider(height: 30),

            const LoginWithGoogle(),
          ],
        ),
      ),
    );
  }
}