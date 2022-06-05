import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:phone_auth/phone_signin.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void logOut() async {
      await FirebaseAuth.instance.signOut();
      Navigator.popUntil(context, (route) => route.isFirst);
      Navigator.pushReplacement(
        context, 
        CupertinoPageRoute(
          builder: (context) => SignInWithPhone(),
        ),
      );
    }



    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        actions: [
          IconButton(
            onPressed: logOut,
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Text(
          FirebaseAuth.instance.currentUser!.phoneNumber.toString(),
        ),
      ),
    );
  }
}
