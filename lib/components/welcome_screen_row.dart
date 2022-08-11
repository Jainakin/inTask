import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intask/constants.dart';

class WelcomeScreenRow extends StatelessWidget {
  WelcomeScreenRow(
      {required this.icon, required this.title, required this.content});

  final IconData icon;
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 15.0),
          child: Icon(
            icon,
            size: 60.0,
            color: Colors.white,
          ),
        ),
        Flexible(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: kWelcomeScreenRowTitleTextStyle,
              ),
              Text(
                content,
                style: kWelcomeScreenRowContentTextStyle,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
