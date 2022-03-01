import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/app/sign_in/sign_in_button.dart';
import 'package:time_tracker_flutter_course/app/sign_in/social_sign_in_button.dart';
import 'package:time_tracker_flutter_course/common_widgets/custom_raised_button.dart';
import 'package:time_tracker_flutter_course/services/auth.dart';
import 'package:time_tracker_flutter_course/services/print_c.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({
    Key? key,
    required this.auth,
  }) : super(key: key);
  final AuthBase auth; // =>  /services/auth.dart

  Future<void> _signInAnonymously() async {
    try {
      await auth.signInAnonymously();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _signInWithGoogle() async {
    try {
      await auth.signInWithGoogle();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _signInWithFB() async {
    try {
      await auth.signInWithFaceBook();
    } catch (e) {
      print(e.toString());
    }
  }

  printInConsole(title, msg) {
    PrintInConsole printc = new PrintInConsole();
    printc.printInCS(title, msg);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Tracker'),
        elevation: 2.0,
      ),
      body: _buildContent(),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const Text(
            'Sign in',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 48.0),
          SocialSignInButton(
            assetName: 'images/google-logo.png',
            text: 'Sign in with Google',
            textColor: Colors.black87,
            color: Colors.white,
            onPressed: _signInWithGoogle,
          ),
          const SizedBox(height: 8.0),
          SocialSignInButton(
            assetName: 'images/facebook-logo.png',
            text: 'Sign in with Facebook',
            textColor: Colors.white,
            color: const Color(0xFF334D92),
            onPressed: _signInWithFB,

            // onPressed: () {},
          ),
          const SizedBox(height: 8.0),
          SocialSignInButton(
            text: 'Sign in with email',
            textColor: Colors.white,
            color: const Color(0xFF00796B),
            onPressed: () {},
            assetName: 'images/email-logo.png',
          ),
          const SizedBox(height: 8.0),
          const Text(
            'or',
            style: TextStyle(fontSize: 14.0, color: Colors.black87),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8.0),
          SocialSignInButton(
            text: 'Sign in Anonymously',
            textColor: Colors.black,
            color: const Color(0xFFDCE775),
            onPressed: _signInAnonymously,
            assetName: 'images/anon-logo.png',
          ),
        ],
      ),
    );
  }
}
