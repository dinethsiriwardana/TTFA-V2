import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/services/auth.dart';
import 'package:time_tracker_flutter_course/services/print_c.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.auth}) : super(key: key);
  final AuthBase auth; // =>  /services/auth.dart

  printInConsole(title, msg) {
    PrintInConsole printc = new PrintInConsole();
    printc.printInCS(title, msg);
  }

  Future<void> _signOut() async {
    if (auth.currentUser!.isAnonymous) {
      try {
        await auth.deleteOut();
        printInConsole("currentUser isAnonymous ", " Delete and Logout");
      } catch (e) {
        print(e.toString());
      }
    } else {
      try {
        await auth.signOut();
        printInConsole("currentUser.isnt Anonymous ", " Logoutt");
      } catch (e) {
        print(e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: <Widget>[
          TextButton(
            child: const Text(
              'Logout',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
            onPressed: _signOut,
          ),
        ],
      ),
    );
  }
}
