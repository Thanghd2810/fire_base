import 'package:flutter/material.dart';
import 'package:flutter_chat/services/firebase_auth_service.dart';
import 'package:flutter_chat/widgets/chats_widget/new_message.dart';

import '../widgets/chats_widget/messages.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Chat app flutter"),
        actions: [
          DropdownButton(
            icon: Icon(
              Icons.more_vert,
              color: Theme.of(context).primaryIconTheme.color,
            ),
            items: [
              DropdownMenuItem(
                  value: "logout",
                  child: SizedBox(
                    child: Row(
                      children: const [
                        Icon(Icons.exit_to_app),
                        SizedBox(
                          width: 6,
                        ),
                        Text("Logout")
                      ],
                    ),
                  ))
            ],
            onChanged: (itemIdentifier) {
              if (itemIdentifier == "logout") {
                FireBaseAuthService.signOut();
              }
            },
          ),
        ],
      ),
      body: SizedBox(
        child: Column(
          children: const [
            Expanded(
              child: Messages(),
            ),
            NewMessage()
          ],
        ),
      ),
    );
  }
}
