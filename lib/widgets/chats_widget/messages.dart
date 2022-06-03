import 'package:flutter/material.dart';
import 'package:flutter_chat/services/firebase_store.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_chat/widgets/chats_widget/message_bubble.dart';

import '../../models/chat.dart';
import '../../services/firebase_auth_service.dart';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Chat>>(
        stream: FireBaseStore.getChatsData.snapshots(),
        builder: (context, chatSnapshot) {
          if (chatSnapshot.hasError) {
            return Center(
              child: Text(chatSnapshot.error.toString()),
            );
          }
          if (chatSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.red,
            ));
          }
          final data = chatSnapshot.requireData.docs;
          return ListView.builder(
            reverse: true,
            itemCount: data.length,
            itemBuilder: (context, index) {
              final chat = data[index];

              return MessageBubble(
                message: chat["message"],
                isMe: chat["uid"] == FireBaseAuthService.currentUser!.uid,
                key: ValueKey(chat["uid"]),
              );
            },
          );
        });
  }
}
