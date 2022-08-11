import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intask/components/ios_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:intask/constants.dart';
import 'package:intask/screens/user_details.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  void didChangeDependencies(){
    precacheImage(AssetImage("assets/images/image10.jpg"), context);
    precacheImage(AssetImage("assets/images/image11.jpg"), context);
    precacheImage(NetworkImage(user.photoURL!.replaceAll("s96-c", "s400-c").toString()), context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 50.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Welcome',
                    style: kTextStyle_W600_S40,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, UserDetailsScreen.id);
                    },
                    child: Hero(
                      tag: 'user',
                      child: CircleAvatar(
                        radius: 20.0,
                        backgroundImage: NetworkImage(user.photoURL!.replaceAll("s96-c", "s400-c").toString()),
                      ),
                      transitionOnUserGestures: true,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.0),
              iOSButton(
                cardTitle: 'Post a task',
                imageNumber: '11',
                height: 200.0,
                route: 'task_posting_screen',
              ),
              SizedBox(height: 30.0),
              iOSButton(
                cardTitle: 'Complete a task',
                imageNumber: '10',
                height: 200.0,
                route: 'task_listing_screen',
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavBar(),
    );
  }
}
