import 'package:flutter/material.dart';
import 'package:flutter_chat/models/chat.dart';
import 'package:flutter_chat/services/firebase_auth_service.dart';

import '../../services/firebase_store.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({Key? key}) : super(key: key);

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  var _enterMessage = "";
  final TextEditingController _controller = TextEditingController();
  void _sendMessage() {
    FocusScope.of(context).unfocus();
    FireBaseStore.addNewMessage(Chat(
      message: _enterMessage,
      createAt: DateTime.now(),
      uid: FireBaseAuthService.currentUser!.uid,
    ));
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
              child: TextField(
            controller: _controller,
            decoration: const InputDecoration(labelText: "Gửi tin nhắn mới"),
            onChanged: (value) {
              setState(() {
                _enterMessage = value;
              });
            },
          )),
          IconButton(
            onPressed: _enterMessage.trim().isEmpty ? null : _sendMessage,
            color: Theme.of(context).primaryColor,
            icon: const Icon(
              Icons.send,
            ),
          )
        ],
      ),
    );
  }
}
