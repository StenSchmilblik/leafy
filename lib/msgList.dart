import 'package:flutter/material.dart';

import 'conversationList.dart';

class Message {
  final String sender;
  final String text;
  final String timestamp;

  Message({required this.sender, required this.text, required this.timestamp});
}

class MsgList extends StatelessWidget {
  final Conversation conversation;

  MsgList({required this.conversation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(conversation.contactName),
      ),
      body: ListView.builder(
        itemCount: conversation.messages.length,
        itemBuilder: (context, index) {
          final message = conversation.messages[index];
          return ListTile(
            title: Text(message.sender),
            subtitle: Text(message.text),
            trailing: Text(message.timestamp),
          );
        },
      ),
    );
  }
}
