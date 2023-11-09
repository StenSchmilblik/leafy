import 'package:flutter/material.dart';
import 'msgList.dart';

class Conversation {
  final String contactName;
  final List<Message> messages;

  Conversation({required this.contactName, required this.messages});

  String get lastMessage {
    if (messages.isNotEmpty) {
      return messages.last.text;
    } else {
      return "Aucun message";
    }
  }
}

class ConversationList extends StatelessWidget {
  final List<Conversation> conversations = [
    // Liste de conversations
    Conversation(
      contactName: "Nom du Contact 1",
      messages: [
        Message(sender: "Expéditeur 1", text: "Message 1", timestamp: "00:00"),
        Message(sender: "Expéditeur 2", text: "Message 2", timestamp: "00:01"),
      ],
    ),
    Conversation(
      contactName: "Nom du Contact 2",
      messages: [
        Message(sender: "Expéditeur 3", text: "Message 3", timestamp: "00:10"),
        Message(sender: "Expéditeur 4", text: "Message 4", timestamp: "00:15"),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des Conversations'),
      ),
      body: ListView.builder(
        itemCount: conversations.length,
        itemBuilder: (context, index) {
          final conversation = conversations[index];
          return ListTile(
            leading: const CircleAvatar(
            ),
            title: Text(conversation.contactName),
            subtitle: Text(conversation.lastMessage),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MsgList(conversation: conversation),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
