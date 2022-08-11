import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intask/constants.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String emailValue = '';
  String passwordValue = '';

  @override
  void didChangeDependencies() {
    precacheImage(AssetImage("assets/images/vector.png"), context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'vector',
              child: Image.asset(
                "assets/images/vector.png",
                height: 200.0,
              ),
              transitionOnUserGestures: true,
            ),
            SizedBox(height: 48.0),
            CupertinoTextField(
              padding: EdgeInsets.all(16.0),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              placeholder: 'Email',
              placeholderStyle: kTextFieldPlaceHolderTextSytle,
              style: kTextFieldTextStyle,
              decoration: BoxDecoration(
                color: CupertinoColors.systemFill,
                border: Border.all(width: 2.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
              cursorColor: CupertinoColors.activeBlue,
              onChanged: (value) => setState(() => this.emailValue),
              onSubmitted: (value) => print('Submitted email: $value'),
            ),
            SizedBox(
              height: 8.0,
            ),
            CupertinoTextField(
              padding: EdgeInsets.all(16.0),
              obscureText: true,
              obscuringCharacter: '*',
              placeholder: 'Password',
              placeholderStyle: kTextFieldPlaceHolderTextSytle,
              style: kTextFieldTextStyle,
              decoration: BoxDecoration(
                color: CupertinoColors.systemFill,
                border: Border.all(width: 2.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
              cursorColor: CupertinoColors.activeBlue,
              onChanged: (value) => setState(() => this.passwordValue),
              onSubmitted: (value) => print('Submitted password: $value'),
            ),
            SizedBox(
              height: 24.0,
            ),
            CupertinoButton(
              color: CupertinoColors.activeBlue,
              padding: EdgeInsets.zero,
              child: Text(
                'Log In',
                style: kButtonTextStyle,
              ),
              onPressed: () {
                Navigator.pop(context);
                // Navigator.pushNamed(context, HomePage.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}