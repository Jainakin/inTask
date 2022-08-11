import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intask/components/listed_task_progress_card.dart';
import 'package:intask/constants.dart';
import 'package:intask/components/Task.dart';
import 'dart:math';

class UsersPostedTasksScreen extends StatefulWidget {
  static String id = 'users_posted_tasks_screen';

  @override
  State<UsersPostedTasksScreen> createState() => _UsersPostedTasksScreenState();
}

class _UsersPostedTasksScreenState extends State<UsersPostedTasksScreen> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 15.0, left: 15.0, right: 15.0, bottom: 10.0),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 50.0),
            Text(
              'Your posted tasks',
              style: kTextStyle_W600_S40,
            ),
            Flexible(
              child: StreamBuilder<List<Task>>(
                stream: readTasks(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final tasks = snapshot.data!;
                    return ListView(
                      children: tasks.map(buildTaskCard).toList(),
                    );
                  } else if (snapshot.hasError) {
                    return Text('Something went wrong!');
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  String rantInt() {
    Random random = new Random();
    return random.nextInt(10).toString();
  }

  Widget buildTask(Task task) => ListTile(
        leading: Text(task.title),
        title: Text(task.notes),
      );

  Widget buildTaskCard(Task task) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: ListedTaskProgressCard(
          imageNumber: rantInt(),
          height: 150.0,
          task: task,
          id: task.id,
        ),
      );

  Stream<List<Task>> readTasks() => FirebaseFirestore.instance
      .collection('postedTasks')
      .where("userEmail", isEqualTo: user.email!.toString())
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Task.fromJSON(doc.data())).toList());
}
