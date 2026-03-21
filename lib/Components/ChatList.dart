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
        padding: EdgeInsets.all(8),
        itemCount: messages.length,
        itemBuilder: (context, index) {
          final message = messages[index];
          return Align(
            alignment: message["isMe"]
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 4),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: message["isMe"] ? Colors.blue[200] : Colors.grey[300],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(message["text"], style: TextStyle(fontSize: 16)),
            ),
          );
        },
      ),
    );
  }
}
