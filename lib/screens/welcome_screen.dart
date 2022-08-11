import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intask/components/welcome_screen_row.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:intask/provider/google_sign_in.dart';
import 'login_screen.dart';
import 'package:provider/provider.dart';
import 'package:intask/constants.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  @override
  void didChangeDependencies(){
    precacheImage(AssetImage("assets/images/vector.png"), context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'Welcome to',
              style: kTextStyle_W900_S40,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Hero(
                      tag: 'vector',
                      child: Image.asset(
                        "assets/images/vector.png",
                        height: 50.0,
                      ),
                      transitionOnUserGestures: true,
                    ),
                  ),
                  TypewriterAnimatedTextKit(
                    text: ['inTask'],
                    textStyle: kTextStyle_W900_S40_ActiveBlue,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50.0),
            WelcomeScreenRow(
              icon: CupertinoIcons.rectangle_paperclip,
              title: 'Post a task',
              content:
                  'List your task, sit back and relax while your chores are taken care of.',
            ),
            const SizedBox(height: 50.0),
            WelcomeScreenRow(
                icon: CupertinoIcons.hammer_fill,
                title: 'Complete a task',
                content:
                    'Pick a task of your choice, complete it and get rewarded.'),
            const Spacer(),
            CupertinoButton(
              color: CupertinoColors.activeBlue,
              padding: EdgeInsets.zero,
              child: const Text(
                'Log In',
                style: kButtonTextStyle,
              ),
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            CupertinoButton(
              padding: EdgeInsets.zero,
              child: RichText(
                text: const TextSpan(
                  style: kTransparentButtonTextStyle,
                  children: [
                    TextSpan(text: 'Sign Up with  '),
                    WidgetSpan(
                      child: Icon(
                        FontAwesomeIcons.google,
                        color: Colors.white,
                        size: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
              onPressed: () {
                final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.googleLogin();
              },
            ),
            const SizedBox(height: 40.0),
          ],
        ),
      ),
    );
  }
}