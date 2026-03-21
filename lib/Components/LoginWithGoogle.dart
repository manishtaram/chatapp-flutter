// ignore_for_file: file_names

import 'package:app/Components/UiHelper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:app/Components/ChatList.dart';

class LoginWithGoogle extends StatefulWidget {
  const LoginWithGoogle({super.key});

  @override
  State<LoginWithGoogle> createState() => _LoginWithGoogleState();
}

class _LoginWithGoogleState extends State<LoginWithGoogle> {
//    GoogleSignIn _googleSignIn = GoogleSignIn('email');

  Future<void> login() async {
//     try {
//       final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

//       if (googleUser == null) return;

//       final GoogleSignInAuthentication googleAuth =
//           await googleUser.authentication;

//       final OAuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );

//       await FirebaseAuth.instance.signInWithCredential(credential);

//       if (!mounted) return;

//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) => ChatScreen(),
//         ), 
//       );
//     } catch (e) {
//       debugPrint("Login error: $e");

//       if (!mounted) return;
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(SnackBar(content: Text("Error signing in: $e")));
//     }
  }

  @override
  Widget build(BuildContext context) {
    return Uihelper.CustomIconbutton(
      login, 
      "Sign In with Google",
      Icons.login,
      Colors.blue,
    );
  }
}

extension on GoogleSignInAuthentication {
  String? get accessToken => null;
}


