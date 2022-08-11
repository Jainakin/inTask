import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'home_screen.dart';
import 'package:intask/constants.dart';
import 'package:intask/components/Task.dart';

class TaskPostingScreen extends StatefulWidget {
  static String id = 'task_posting_screen';

  @override
  State<TaskPostingScreen> createState() => _TaskPostingScreenState();
}

class _TaskPostingScreenState extends State<TaskPostingScreen> {
  final user = FirebaseAuth.instance.currentUser!;
  final titleController = TextEditingController();
  final notesController = TextEditingController();
  String title = '';
  String notes = '';
  String id = '';

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
              const Text(
                'Post your task',
                style: kTextStyle_W900_S40,
              ),
              const SizedBox(height: 30.0),
              CupertinoTextField(
                controller: titleController,
                padding: const EdgeInsets.all(16.0),
                maxLines: 1,
                textInputAction: TextInputAction.next,
                //placeholder: 'Title',
                prefix: const Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    'Title',
                    style: kTextFieldTextStyle,
                  ),
                ),
                placeholderStyle: kTextFieldPlaceHolderTextSytle,
                style: kTextFieldTextStyle,
                decoration: BoxDecoration(
                  color: CupertinoColors.systemFill,
                  border: Border.all(
                      //color: CupertinoColors.lightBackgroundGray,
                      width: 2.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                cursorColor: CupertinoColors.activeBlue,
                onChanged: (value) => setState(() => this.title = value),
                onSubmitted: (value) => print('Submitted title: $value'),
              ),
              const SizedBox(height: 8.0),
              CupertinoTextField(
                padding: const EdgeInsets.all(16.0),
                maxLines: 10,
                textInputAction: TextInputAction.done,
                prefix: const Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    'Notes',
                    style: kTextFieldTextStyle,
                  ),
                ),
                placeholderStyle: kTextFieldPlaceHolderTextSytle,
                style: kTextFieldTextStyle,
                decoration: BoxDecoration(
                  color: CupertinoColors.systemFill,
                  border: Border.all(
                      //color: CupertinoColors.lightBackgroundGray,
                      width: 2.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                cursorColor: CupertinoColors.activeBlue,
                onChanged: (value) => setState(() => this.notes = value),
                onSubmitted: (value) => print('Submitted title: $value'),
              ),
              const SizedBox(height: 24.0),
              CupertinoButton(
                color: CupertinoColors.activeBlue,
                padding: EdgeInsets.zero,
                child: const Text(
                  'Post',
                  style: kButtonTextStyle,
                ),
                onPressed: () {
                  final task = Task(
                    title: this.title,
                    notes: this.notes,
                    id: this.id,
                    userEmail: user.email!.toString(),
                    userName: user.displayName!.toString(),
                  );
                  createTask(task);
                  Navigator.pop(context, HomeScreen.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future createTask(Task task) async {
    final docTask = FirebaseFirestore.instance.collection('postedTasks').doc();
    task.id = docTask.id;
    this.id = docTask.id;
    final json = task.toJSON();
    await docTask.set(json);
  }
}
