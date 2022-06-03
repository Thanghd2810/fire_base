import 'package:flutter/material.dart';
import 'package:flutter_chat/models/student.dart';
import 'package:flutter_chat/services/firebase_auth_service.dart';
import 'package:flutter_chat/services/firebase_store.dart';
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
      // floatingActionButton: FloatingActionButton(
      //   child: const Icon(
      //     Icons.add_chart,
      //     size: 40,
      //   ),
      //   onPressed: () {
      //     FireBaseStore.addData(Student(
      //         age: 12,
      //         lop: "62Pm1",
      //         name: "Trần Phú Duẩn",
      //         subjects: [
      //           "Hoá đại cương",
      //           "Tin đại cương",
      //           "Lý đại cương",
      //           "Văn đại cương"
      //         ]));
      //   },
      // ),
    );
  }
}
