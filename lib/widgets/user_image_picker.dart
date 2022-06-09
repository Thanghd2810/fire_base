import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  UserImagePicker({Key? key}) : super(key: key);

  @override
  State<UserImagePicker> createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  XFile? _pickedImage;

  void _pickImage() async {
    final pickImageFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      _pickedImage = pickImageFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage:
              _pickedImage != null ? FileImage(File(_pickedImage!.path)) : null,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: GestureDetector(
            onTap: _pickImage,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.image),
                SizedBox(
                  width: 8,
                ),
                Text("Add image"),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
