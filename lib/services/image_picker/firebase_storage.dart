import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageService {
  /// ref is root bucket .child 1 is foled , .child 2 is file
  static final _firebaseStorage =
      FirebaseStorage.instance.ref().child("user_image");
}
