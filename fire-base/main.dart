import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fire/firebase_options.dart';
import 'package:fire/home.dart';
import 'package:fire/signup.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: First(),
    );
  }
}

class First extends StatefulWidget {
  const First({super.key});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  TextEditingController tc = TextEditingController();
  TextEditingController tc2 = TextEditingController();
  FirebaseAuth outh = FirebaseAuth.instance;

  Future<void> SingIn(String email, String password) async {
    try {
      UserCredential credential = await outh.signInWithEmailAndPassword(
          email: email, password: password);

      if (credential.user != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Home()));
      }
    } catch (e) {
      print(e);
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
            decoration: const InputDecoration(
                labelText: "email", hintText: "enter your email"),
          ),
          const SizedBox(
            height: 25,
          ),
          TextField(
            controller: tc2,
            decoration: const InputDecoration(
                labelText: "password", hintText: "enter your password"),
          ),
          const SizedBox(
            height: 25,
          ),
          ElevatedButton(
              onPressed: () {
                SingIn(tc.text, tc2.value.text);
              },
              child: const Text("sigin")),
          const SizedBox(
            height: 25,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => const Second()));
              },
              child: const Text("signup")),
        ],
      ),
    );
  }
}
