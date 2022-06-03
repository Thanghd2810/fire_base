import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_chat/models/student.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/chat.dart';

class FireBaseStore {
  /// init firestore chat's collection
  ///
  ///
  static final _initCollection = FirebaseFirestore.instance
      .collection('chats/tdaB98vWhEZLaQSStrGs/messages');

  /// init firestore chat's collection
  ///
  ///
  static final _initChatsCollection = FirebaseFirestore.instance
      .collection('chatapp/Bp8NSmHMlkRmYH2b7KP6/messages');

  /// init firestore user's collection
  ///
  static final _initUserCollection =
      FirebaseFirestore.instance.collection('users');

  /// getData from collection in firestore
  ///
  static final getData = _initCollection.withConverter<Student>(
    fromFirestore: (snapshots, _) => Student.fromJson(snapshots.data()!),
    toFirestore: (student, _) => student.toJson(),
  );

  /// getData from chatappcollection in firestore
  ///
  static final getChatsData = _initChatsCollection
      .orderBy('createAt', descending: true)
      .withConverter<Chat>(
        fromFirestore: (snapshots, _) {
          return Chat.fromJson(snapshots.data()!);
        },
        toFirestore: (chat, _) => chat.toJson(),
      );

  /// add data to collection in firestore
  ///
  static Future<DocumentReference<Map<String, dynamic>>> addData(
      Student student) {
    return _initCollection.add(student.toJson());
  }

  /// add data to Chatscollection in firestore
  ///
  static Future<DocumentReference<Map<String, dynamic>>> addNewMessage(
      Chat chat) {
    return _initChatsCollection.add(chat.toJson());
  }

  /// set DataUser while login to collection in firestore
  ///
  static Future<void> setDataUser({
    required UserCredential userCredential,
    required String email,
    required String password,
  }) {
    return _initUserCollection.doc(userCredential.user!.uid).set(
      {
        "username": email,
        "password": password,
      },
    );
  }
}
