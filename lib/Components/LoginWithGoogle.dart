// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:firebase_core/firebase_core.dart'; // Ensure this is initialized in main.dart
import 'package:app/Components/ChatList.dart'; // Ensure ChatScreen is defined here
import 'package:app/Components/UiHelper.dart';

class LoginWithGoogle extends StatefulWidget {
  const LoginWithGoogle({super.key});

  @override
  State<LoginWithGoogle> createState() => _LoginWithGoogleState();
}

class _LoginWithGoogleState extends State<LoginWithGoogle> {

  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeGoogleSignIn();
  }

  Future<void> _initializeGoogleSignIn() async {
    try {
      await _googleSignIn.initialize();
      setState(() {
        _isInitialized = true;
      });
    } catch (e) {
      debugPrint("Initialization error: $e");
    }
  }

  void login() async {
    // Ensure initialized before proceeding
    if (!_isInitialized) {
      await _initializeGoogleSignIn();
    }

    try {
      // v7: authenticate() replaces signIn()
      final GoogleSignInAccount googleUser = await _googleSignIn.authenticate(
        scopeHint: ['email'],
      );

      // v7: Get the authorization client to retrieve the access token
      final authClient = _googleSignIn.authorizationClient;
      final authorization = await authClient.authorizationForScopes(['email']);

      if (authorization == null) {
        throw Exception("Failed to get authorization tokens");
      }

      final credential = GoogleAuthProvider.credential(
        accessToken: authorization.accessToken,
        idToken: googleUser
            .authentication
            .idToken, // authentication is now sync in v7
      );

      // Sign in with Firebase
      await FirebaseAuth.instance.signInWithCredential(credential);

      if (!mounted) return;

      // Navigate to your home/chat screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              ChatScreen(), // Added const for performance
        ),
      );
    } catch (e) {
      debugPrint("Login error: $e");

      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error signing in: $e")));
    }
  }

  @override
  Widget build(BuildContext context) {
    // Note: If UiHelper class uses lowercase 'u', keep it.
    // Usually, classes start with Uppercase (UiHelper).
    return Uihelper.CustomIconbutton(
      login,
      "Sign In with Google",
      Icons.login,
      Colors.blue,
    );
  }
}




