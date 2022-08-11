import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intask/constants.dart';
import 'package:intask/components/Task.dart';
import 'package:intask/screens/task_progress_screen.dart';

class ListedTaskProgressCard extends StatelessWidget {
  ListedTaskProgressCard(
      {required this.imageNumber,
      required this.height,
      required this.task,
      required this.id});

  final String imageNumber;
  final double height;
  final Task task;
  final String id;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => TaskProgressScreen(
                task_id: task.id,
                task_title: task.title,
                task_notes: task.notes),
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
