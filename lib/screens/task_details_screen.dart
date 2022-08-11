import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intask/constants.dart';
import 'package:intask/screens/active_task.dart';

class TaskDetailsScreen extends StatelessWidget {
  TaskDetailsScreen({required this.title, required this.notes, required this.id});

  final String title;
  final String notes;
  final String id;

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
              const SizedBox(height: 50.0),
              Text(
                title,
                style: kTextStyle_W900_S40,
              ),
              const SizedBox(height: 30.0),
              const Text(
                'Notes',
                style: kWelcomeScreenRowTitleTextStyle,
              ),
              const SizedBox(height: 8.0),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: CupertinoColors.systemFill,
                  border: Border.all(
                      //color: CupertinoColors.lightBackgroundGray,
                      width: 2.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                height: 300.0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                        notes,
                        style: kWelcomeScreenRowContentTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24.0),
              CupertinoButton(
                color: CupertinoColors.activeBlue,
                padding: EdgeInsets.zero,
                child: const Text(
                  'Start task',
                  style: kButtonTextStyle,
                ),
                onPressed: () {
                  // task_completer = '';
                  // poster = true;
                  // final docUser = FirebaseFirestore.instance.collection('postedTasks').doc(id);
                  // docUser.delete();
                  Screens[1] = ActiveTask(
                    title: title,
                    notes: notes,
                  );
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
