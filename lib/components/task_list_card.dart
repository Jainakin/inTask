import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intask/components/ios_button.dart';
import 'package:intask/constants.dart';


class TasklistCard extends StatefulWidget {
  @override
  State<TasklistCard> createState() => _TasklistCardState();
}

class _TasklistCardState extends State<TasklistCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(height: 50.0),
          Text(
            'Pick a task',
            style: kTextStyle_W600_S40,
          ),
          SizedBox(height: 30.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: iOSButton(
                  cardTitle: 'Task 1',
                  imageNumber: '6',
                  height: 150.0,
                  route: 'task_details_screen',
                ),
              ),
              SizedBox(width: 15.0),
              Expanded(
                flex: 1,
                child: iOSButton(
                  cardTitle: 'Task 2',
                  imageNumber: '7',
                  height: 150.0,
                  route: 'task_details_screen',
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
