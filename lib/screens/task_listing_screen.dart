import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intask/components/listed_task_card.dart';
import 'package:intask/constants.dart';
import 'package:intask/components/Task.dart';
import 'dart:math';

class TaskListingScreen extends StatefulWidget {
  static String id = 'task_listing_screen';

  @override
  State<TaskListingScreen> createState() => _TaskListingScreenState();
}

class _TaskListingScreenState extends State<TaskListingScreen> {
  @override
  void didChangeDependencies() {
    precacheImage(AssetImage("assets/images/image0.jpg"), context);
    precacheImage(AssetImage("assets/images/image1.jpg"), context);
    precacheImage(AssetImage("assets/images/image2.jpg"), context);
    precacheImage(AssetImage("assets/images/image3.jpg"), context);
    precacheImage(AssetImage("assets/images/image4.jpg"), context);
    precacheImage(AssetImage("assets/images/image5.jpg"), context);
    precacheImage(AssetImage("assets/images/image6.jpg"), context);
    precacheImage(AssetImage("assets/images/image7.jpg"), context);
    precacheImage(AssetImage("assets/images/image8.jpg"), context);
    precacheImage(AssetImage("assets/images/image9.jpg"), context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 15.0, left: 15.0, right: 15.0, bottom: 0.0),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 50.0),
            Text(
              'Select a task',
              style: kTextStyle_W600_S40,
            ),
            Flexible(
              child: StreamBuilder<List<Task>>(
                stream: readTasks(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final tasks = snapshot.data!;
                    return ListView(
                        children: tasks.map(buildTaskCard).toList());
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
        child: ListedTaskCard(
          imageNumber: rantInt(),
          height: 150.0,
          task: task,
        ),
      );

  Stream<List<Task>> readTasks() => FirebaseFirestore.instance
      .collection('postedTasks')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Task.fromJSON(doc.data())).toList());
}
