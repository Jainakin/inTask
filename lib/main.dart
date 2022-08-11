// @dart=2.9
import 'package:flutter/material.dart';
import 'package:intask/screens/home_page.dart';
import 'package:intask/screens/home_screen.dart';
import 'package:intask/screens/user_details.dart';
import 'package:intask/screens/users_posted_tasks.dart';
import 'package:intask/screens/welcome_screen.dart';
import 'package:intask/screens/login_screen.dart';
import 'package:intask/screens/task_posting_screen.dart';
import 'package:intask/screens/task_listing_screen.dart';
import 'package:intask/screens/task_progress_screen.dart';
import 'package:intask/screens/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:intask/provider/google_sign_in.dart';
import 'package:flutter/services.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
    precacheImage(AssetImage("assets/images/image10.jpg"), context);
    precacheImage(AssetImage("assets/images/image11.jpg"), context);
    precacheImage(AssetImage("assets/images/splash.png"), context);
    precacheImage(AssetImage("assets/images/vector.png"), context);
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: HomePage.id,
        routes: {
          WelcomeScreen.id : (context) => WelcomeScreen(),
          LoginScreen.id : (context) => LoginScreen(),
          HomeScreen.id : (context) => HomeScreen(),
          TaskPostingScreen.id : (context) => TaskPostingScreen(),
          TaskListingScreen.id : (context) => TaskListingScreen(),
          TaskProgressScreen.id : (context) => TaskProgressScreen(),
          MainScreen.id : (context) => MainScreen(),
          HomePage.id : (context) => HomePage(),
          UserDetailsScreen.id : (context) => UserDetailsScreen(),
          UsersPostedTasksScreen.id : (context) => UsersPostedTasksScreen(),
        },
        home: MainScreen(),
      ),
    );
  }
}