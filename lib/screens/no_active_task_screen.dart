import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:intask/constants.dart';

class NoActiveTaskScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TypewriterAnimatedTextKit(
              text: ['No\nActive\nTasks'],
              textStyle: kNoActiveTaskTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}

