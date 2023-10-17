import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire/DataScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  CollectionReference reference = FirebaseFirestore.instance.collection("Student");

  addItem(name, roll, sect)async{
   try{
    await reference.add({
      "name": name,
      "rollNumber": roll,
      "section": sect
    });

   }catch(e){
    print(e.toString());
   } 
  }


  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    TextEditingController roll = TextEditingController();
    TextEditingController sect = TextEditingController();

    return Scaffold(
        appBar: AppBar(
          title: const Text("hello"),
          actions: [
            IconButton(
                onPressed: () {
                  FirebaseAuth.instance
                      .signOut()
                      .whenComplete(() => Navigator.pop(context));
                },
                icon: const Icon(Icons.logout))
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: name,
                decoration: const InputDecoration(
                labelText: "Name"),
          ),
          const SizedBox(height: 20,),
          TextField(
                controller: roll,
                decoration: const InputDecoration(
                labelText: "Roll Number"),
          ),
          const SizedBox(height: 20,),
          TextField(
                controller: sect,
                decoration: const InputDecoration(
                labelText: "Section"),
          ),
          const SizedBox(height: 20,),
          ElevatedButton(onPressed: (){
            addItem(name.text,roll.text,sect.text);
          }, child: const Text("Add the data")),
          const SizedBox(height: 20,),
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const DataScreen();
            },)
            );
          }, child: const Text("See the data"))
            ],
          ),
        ));
  }
}
