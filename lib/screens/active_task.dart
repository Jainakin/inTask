import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intask/constants.dart';
import 'package:intask/screens/home_page.dart';
import 'package:intask/screens/no_active_task_screen.dart';

class ActiveTask extends StatelessWidget {
  ActiveTask({required this.title, required this.notes});

  final String title;
  final String notes;

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
                  'Flag as completed',
                  style: kButtonTextStyle,
                ),
                onPressed: () {
                  poster = true;
                  Screens[1] = NoActiveTaskScreen();
                  Navigator.popAndPushNamed(context, HomePage.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
