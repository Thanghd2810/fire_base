class Chat {
  final String message;
  final DateTime createAt;
  final String uid;
  Chat({
    required this.message,
    required this.createAt,
    required this.uid,
  });

  Chat.fromJson(Map<String, Object?> json)
      : this(
          message: json['message']! as String,
          createAt: json['createAt']! as DateTime,
          uid: json['uid']! as String,
        );

  Map<String, Object?> toJson() {
    return {
      'message': message,
      'createAt': createAt,
      'uid': uid,
    };
  }
}
