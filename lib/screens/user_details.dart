import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intask/constants.dart';
import 'package:intask/provider/google_sign_in.dart';
import 'package:provider/provider.dart';

class UserDetailsScreen extends StatefulWidget {
  static String id = 'user_details_screen';

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  void didChangeDependencies(){
    precacheImage(NetworkImage(user.photoURL!.replaceAll("s96-c", "s400-c").toString()), context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const <Widget>[
                SizedBox(height: 50.0),
                Text(
                  'User Details',
                  style: kTextStyle_W600_S40,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Hero(
                  tag: 'user',
                  child: CircleAvatar(
                    radius: 125.0,
                    backgroundImage: NetworkImage(user.photoURL!.replaceAll("s96-c", "s400-c").toString()),
                  ),
                  transitionOnUserGestures: true,
                ),
                SizedBox(height: 48.0),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Name: ${user.displayName!}',
                    style: kWelcomeScreenRowContentTextStyle,
                  ),
                ),
                SizedBox(height: 8.0),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Email: ${user.email!}',
                    style: kWelcomeScreenRowContentTextStyle,
                  ),
                ),
                SizedBox(height: 24.0),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: const Text(
                    'Log Out',
                    style: kLogOutButtonTextStyle,
                  ),
                  onPressed: () {
                    final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
                    provider.googleLogout();
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
