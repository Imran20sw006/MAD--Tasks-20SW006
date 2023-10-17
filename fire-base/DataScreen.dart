import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DataScreen extends StatefulWidget {
  const DataScreen({super.key});

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  CollectionReference reference =
      FirebaseFirestore.instance.collection("Student");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Saved data"),
      ),
      body: Column(children: [
        Expanded(
          child: StreamBuilder(
            stream: reference.snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                // Data is available, you can safely access it
                List list = snapshot.data!.docs;
                return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(list[index]["name"]),
                      subtitle: Text(list[index]["rollNumber"]),
                      trailing: Text(list[index]["section"]),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                // Handle any errors here
                return Text("Error: ${snapshot.error}");
              } else {
                // Data is still loading, you can show a loading indicator
                return CircularProgressIndicator();
              }
            },
          ),
        )
      ]),
    );
  }
}
