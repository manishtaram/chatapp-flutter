import 'package:app/Components/chat_user_card.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:app/Components/LoginWithEmail.dart';

class ChatScreen extends StatelessWidget {
  final List<Map<String, dynamic>> messages = [
    {"text": "Hey, how are you?", "isMe": false},
    {"text": "I’m good! Working on Flutter.", "isMe": true},
    {"text": "Nice! Show me your progress.", "isMe": false},
    {"text": "Sure, I’ll send screenshots.", "isMe": true},
  ];
  // final GoogleSignIn _googleSignIn = GoogleSignIn();

  ChatScreen({super.key});

  Future<void> logout(BuildContext context) async {
    // await _googleSignIn.signOut();
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginWithEmail()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat List"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => logout(context),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 16,
        padding: EdgeInsets.only(top: 10),
        physics: ScrollPhysics(),
        itemBuilder: (context, index) {
          
          return const ChatUserCard();
        },
      ),
    );
  }
}
