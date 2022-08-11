import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intask/constants.dart';

class iOSButton extends StatelessWidget {
  iOSButton({required this.cardTitle, required this.imageNumber, required this.height, required this.route});

  final String cardTitle;
  final String imageNumber;
  final double height;
  final String route;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
        print('Card Pressed');
    },
      child: Container(
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/image$imageNumber.jpg'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Text(
            '$cardTitle',
            style: kTextStyle_W600_S30,
          ),
        ),
      ),
    );
  }
}
