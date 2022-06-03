import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    Key? key,
    required this.message,
    required this.isMe,
  }) : super(key: key);
  final String message;
  final bool isMe;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Center(
          child: Container(
            width: 120,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            decoration: BoxDecoration(
              color: isMe ? Colors.purple[300] : Colors.blue[200],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              message,
              style: TextStyle(
                  color: isMe ? Colors.white : Colors.black, fontSize: 16),
            ),
          ),
        )
      ],
    );
  }
}
