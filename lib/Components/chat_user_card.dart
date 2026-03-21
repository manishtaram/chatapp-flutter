import 'package:flutter/material.dart';

class ChatUserCard extends StatefulWidget {
  const ChatUserCard({super.key});

  @override
  State<ChatUserCard> createState() => _ChatUserCardState();
}

class _ChatUserCardState extends State<ChatUserCard> {
  @override
  Widget build(BuildContext context) {
    return Card(child: InkWell(
      onTap: () {},
      child: ListTile(
        leading: CircleAvatar(
          child: Icon(Icons.person),
        ),
        title: Text("DEMO USER"),
        subtitle: Text("Online", maxLines: 1,),
        trailing: Text("12:00 PM"),
      ),
    ),);
  }
}