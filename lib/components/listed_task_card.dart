import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intask/screens/task_details_screen.dart';
import 'package:intask/constants.dart';
import 'package:intask/components/Task.dart';

class ListedTaskCard extends StatelessWidget {
  ListedTaskCard(
      {required this.imageNumber,
      required this.height,
      required this.task});

  final String imageNumber;
  final double height;
  final Task task;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => TaskDetailsScreen(
                title: task.title, notes: task.notes, id: task.id,),
          ),
        );
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
            '${task.title}',
            style: kTextStyle_W600_S30,
          ),
        ),
      ),
    );
  }
}
