import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intask/screens/home_screen.dart';
import 'package:intask/screens/no_active_task_screen.dart';
import 'package:intask/screens/users_posted_tasks.dart';

final Screens = [HomeScreen(), NoActiveTaskScreen(), UsersPostedTasksScreen()];

String task_completer = '';

bool tasker = false;
bool poster = false;

const kTextStyle_W900_S40 = TextStyle(
  color: Colors.white,
  fontFamily: 'SFUIDisplay',
  fontWeight: FontWeight.bold,
  fontSize: 40.0,
);

const kTextStyle_W900_S40_ActiveBlue = TextStyle(
  color: CupertinoColors.activeBlue,
  fontFamily: 'SFUIDisplay',
  fontWeight: FontWeight.w900,
  fontSize: 40.0,
);

const kNoActiveTaskTextStyle = TextStyle(
  color: CupertinoColors.white,
  fontFamily: 'SFUIDisplay',
  fontWeight: FontWeight.w900,
  fontSize: 100.0,
);

const kTextStyle_W600_S40 = TextStyle(
  color: Colors.white,
  fontFamily: 'SFUIDisplay',
  fontWeight: FontWeight.w600,
  fontSize: 40.0,
);

const kTextStyle_W600_S30 = TextStyle(
  color: Colors.white,
  fontFamily: 'SFUIDisplay',
  fontWeight: FontWeight.w600,
  fontSize: 30.0,
);

const kTaskCardTextStyle = TextStyle(
  color: Colors.black,
  fontFamily: 'SFUIDisplay',
  fontWeight: FontWeight.w600,
  fontSize: 30.0,
);

const kButtonTextStyle = TextStyle(
  color: Colors.white,
  fontFamily: 'SFUIDisplay',
  fontWeight: FontWeight.w100,
  fontSize: 20.0,
);

const kTransparentButtonTextStyle = TextStyle(
  color: CupertinoColors.activeBlue,
  fontFamily: 'SFUIDisplay',
  fontWeight: FontWeight.w100,
  fontSize: 15.0,
);

const kLogOutButtonTextStyle = TextStyle(
  color: CupertinoColors.destructiveRed,
  fontFamily: 'SFUIDisplay',
  fontWeight: FontWeight.w100,
  fontSize: 15.0,
);

const kTextFieldPlaceHolderTextSytle = TextStyle(
  fontFamily: 'SFUIDisplay',
  color: CupertinoColors.inactiveGray,
);
const kTextFieldTextStyle = TextStyle(
  fontFamily: 'SFUIDisplay',
  color: CupertinoColors.white,
);

const kWelcomeScreenRowContentTextStyle = TextStyle(
  color: Colors.white,
  fontFamily: 'SFUIDisplay',
  fontSize: 15.0,
  fontWeight: FontWeight.w100,
);

const kWelcomeScreenRowTitleTextStyle = TextStyle(
  color: Colors.white,
  fontFamily: 'SFUIDisplay',
  fontSize: 20.0,
  fontWeight: FontWeight.w600,
);
