import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_chat/models/student.dart';
import 'package:flutter_chat/services/firebase_auth_service.dart';
import 'package:flutter_chat/services/firebase_store.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
                  child: Container(
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
      body: StreamBuilder<QuerySnapshot<Student>>(
        stream: FireBaseStore.getData.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.red,
            ));
          }
          final data = snapshot.requireData.docs;
          return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final student = data[index];
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(student["name"]),
                          Text(student["lop"]),
                          Text(student["age"].toString()),
                        ],
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        student["subjects"].join(","),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                );
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add_chart,
          size: 40,
        ),
        onPressed: () {
          FireBaseStore.addData(Student(
              age: 12,
              lop: "62Pm1",
              name: "Trần Phú Duẩn",
              subjects: [
                "Hoá đại cương",
                "Tin đại cương",
                "Lý đại cương",
                "Văn đại cương"
              ]));
        },
      ),
    );
  }
}
