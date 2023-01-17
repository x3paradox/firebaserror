import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core_dart/firebase_core_dart.dart';

import 'firebase_options.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  @override
  void initState() {
    // TODO: implement initState
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: Firebase.initializeApp(
            options: FirebaseOptions(
                apiKey: 'dkkd',
                appId: 'vv',
                messagingSenderId: 'xv',
                projectId: 'xc'),
          ),
          builder: (context, snapshot) {
            return Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(hintText: 'Enter Your Email'),
                  controller: _email,
                  enableSuggestions: false,
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Enter Your Password'),
                  controller: _password,
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                ),
                TextButton(
                    onPressed: (() async {
                      final email = _email.text;

                      final password = _password.text;
                      final UserCredential = await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                        email: email,
                        password: password,
                      );
                      print(UserCredential);
                    }),
                    child: Text('Register'))
              ],
            );
          },
        ),
      ),
    );
  }
}
