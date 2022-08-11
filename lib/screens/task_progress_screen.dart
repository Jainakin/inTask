import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intask/constants.dart';
import 'package:intask/screens/home_page.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class TaskProgressScreen extends StatefulWidget {
  TaskProgressScreen({required this.task_id, required this.task_title, required this.task_notes});
  static String id = 'task_progress_screen';
  String task_id = '';
  String task_title = '';
  String task_notes = '';

  @override
  State<TaskProgressScreen> createState() => _TaskProgressScreenState();
}

class _TaskProgressScreenState extends State<TaskProgressScreen> {
  @override
  Widget build(BuildContext context) {
    final docUser = FirebaseFirestore.instance
        .collection('postedTasks')
        .doc(widget.task_id);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 50.0),
            const Text(
              'Track Progress',
              style: kTextStyle_W900_S40,
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(CupertinoIcons.rocket,
                    color: CupertinoColors.activeBlue, size: 50.0),
                LoadingAnimationWidget.staggeredDotsWave(
                  color: CupertinoColors.activeBlue,
                  size: 80,
                ),
                Icon(CupertinoIcons.rocket_fill,
                    color: CupertinoColors.activeBlue, size: 50.0),
              ],
            ),
            // user.displayName!
            SizedBox(height: 8.0),
            const Text(
              'Notes',
              style: kWelcomeScreenRowTitleTextStyle,
            ),
            SizedBox(height: 8.0),
            Container(
              height: 300.0,
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: CupertinoColors.systemFill,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      widget.task_notes,
                      style: kWelcomeScreenRowContentTextStyle,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            CupertinoButton(
              color: CupertinoColors.activeBlue,
              padding: EdgeInsets.zero,
              child: const Text(
                'Close task',
                style: kButtonTextStyle,
              ),
              onPressed: () {
                docUser.delete();
                tasker = true;
                Navigator.popAndPushNamed(context, HomePage.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
