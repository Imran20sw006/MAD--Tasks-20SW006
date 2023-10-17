import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fire/home.dart';

class Second extends StatefulWidget {
  const Second({super.key});

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  TextEditingController tc = TextEditingController();
  TextEditingController tc2 = TextEditingController();

  FirebaseAuth outh = FirebaseAuth.instance;

  Future<void> singup(String email, String password) async {
    try {
      UserCredential cred = await outh.createUserWithEmailAndPassword(
          email: email, password: password);

      if (cred.user != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FIrebase"),
      ),
      body: Column(
        children: [
          TextField(
            controller: tc,
            decoration: InputDecoration(
                labelText: "email", hintText: "enter your email"),
          ),
          SizedBox(
            height: 25,
          ),
          TextField(
            controller: tc2,
            obscureText: true,
            decoration: InputDecoration(
                labelText: "password", hintText: "enter your password"),
          ),
          ElevatedButton(
              onPressed: () async {
                singup(tc.text, tc2.value.text);
              },
              child: Text("signup")),
          SizedBox(
            height: 25,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("sigin")),
        ],
      ),
    );
  }
}
