import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intask/screens/main_screen.dart';
import 'package:intask/screens/welcome_screen.dart';

class HomePage extends StatelessWidget {
  static String id = 'home_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            return MainScreen();
          } else if (snapshot.hasError) {
            return Center(child: Text('Something went wrong'));
          } else {
            return WelcomeScreen();
          }
        },
      ),
    );
  }
}
