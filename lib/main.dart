import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lawyer_assist/screens/Add_Case.dart';
import 'package:lawyer_assist/screens/Calendar_Page.dart';
import 'package:lawyer_assist/screens/List_Screen.dart';
import 'package:lawyer_assist/screens/Login_Screen.dart';
import 'package:lawyer_assist/screens/Registration_Screen.dart';
import 'package:lawyer_assist/screens/Welcome_Screen.dart';
import 'package:lawyer_assist/screens/Home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lawyer_assist/screens/View_Case.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
  var logged = FirebaseAuth.instance.currentUser;
  print('new');
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

    initialRoute: FirebaseAuth.instance.currentUser == null ? 'WelcomeScreen' : 'Home',


    routes: {

      'WelcomeScreen': (context) => WelcomeScreen(),
      'LoginScreen': (context) => LoginScreen(),
      'RegistrationScreen': (context) => RegistrationScreen(),
      'Home': (context) => Home(),
      'ListPage': (context) => ListPage(),
      'AddCase': (context) => AddCase(),
      'ViewCase': (context) => ViewCase(),
      'CalendarPageView': (context) => CalendarPageView(),
        }
    );

  }
}
