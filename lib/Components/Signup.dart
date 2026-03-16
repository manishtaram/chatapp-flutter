import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  //   final _auth = FirebaseAuth.instance;

  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();

  void _signUp() async {
    if (_passwordController.text != _confirmController.text) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Passwords do not match")));
      return;
    }

    // try {
    //   UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
    //         email: _emailController.text.trim(),
    //         password: _passwordController.text.trim(),
    //       );

    //   // You can also store username & phone in Firestore
    //   print("User signed up: ${userCredential.user?.uid}");
    // } catch (e) {
    //   print("Error: $e");
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "SIGN UP",
              style: TextStyle(fontSize: 68,fontWeight: .bold, color: Colors.teal),
            ),
            SizedBox(height: 20),

            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: "Enter Username"),
            ),
            TextField(
              
              controller: _emailController,
              decoration: InputDecoration(labelText: "Enter Email" ),
            ),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: "Enter Phone No"),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: "Enter Password"),
              obscureText: true,
            ),
            TextField(
              controller: _confirmController,
              decoration: InputDecoration(labelText: "Confirm Password"),
              obscureText: true,
            ),

            SizedBox(height: 20),
            ElevatedButton(onPressed: _signUp, child: Text("Sign Up")),

            Divider(height: 40),
            ElevatedButton.icon(
              onPressed: () {
                // TODO: Implement Google Sign-In
              },
              icon: Icon(Icons.login),
              label: Text("Sign Up with Google"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}

