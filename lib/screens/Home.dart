import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Home.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _auth = FirebaseAuth.instance;
  late User loggedInUser;

  @override
  void initState() {

    super.initState();
    getCurrentUser();
  }


  void getCurrentUser() async {
    try {
      final usernow = await _auth.currentUser;
      if (usernow != null) {
        loggedInUser = usernow;
        print(loggedInUser.email);

      }
    }
    catch (e) {
      print(e);
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber[100],
          leading: null,
          actions: [
            TextButton(onPressed: (){
              showDialog(context: context,
                builder: (context) => AlertDialog(
                  title: Text('Cerrar sesion'),
                  content: Text('Está seguro que desea cerrar sesion?'),
                  actions: <Widget>[
                    TextButton(onPressed: (){
                      _auth.signOut();
                      Navigator.pushNamed(context, 'WelcomeScreen');

                    },
                      child: Text('OK'),
                    ),
                    TextButton(onPressed:(){ Navigator.pop(context);}, child: Text('NO'))

                  ],

                ),
              );
            },
                child: Text('Cerrar Sesion',
                  style: TextStyle(
                    fontFamily: 'Castoro',
                    color: Colors.black,
                    fontWeight: FontWeight.bold,

                  ),)
            ),
          ],
        ),
      backgroundColor: Colors.amber[50],
      body: Column(
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(

                    icon: const Icon(Icons.note_add_outlined),
                    iconSize: 100.0,
                    onPressed: () {
                      Navigator.pushNamed(context, 'AddCase');
                    },
                  ),
                  Text(
                    'NUEVO CASO',
                    style: TextStyle(
                      fontFamily: 'Castoro',
                      fontSize: 15.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),),
              VerticalDivider(
                color: Colors.black12,
                thickness: 5,
                indent: 20,
                endIndent: 20,
                width: 20,
              ),
              Expanded(child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(

                    icon: const Icon(Icons.view_list_outlined),
                    iconSize: 100.0,
                    onPressed: () {
                      Navigator.pushNamed(context, 'ListPage');
                    },
                  ),
               Text(
                 'LISTA DE CASOS',
                 style: TextStyle(
                   fontFamily: 'Castoro',
                   fontSize: 15.0,
                   color: Colors.black,
                   fontWeight: FontWeight.bold,
                 ),
               ) ],
              ),
              ),
            ],
          )
          ),
          Divider(
            color: Colors.black12,
            thickness: 5,
            indent: 20,
            endIndent: 20,

          ),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(

                    icon: const Icon(Icons.calendar_today_outlined),
                    iconSize: 100.0,
                    onPressed: () {
                      Navigator.pushNamed(context, 'CalendarPageView');
                    },
                  ),
                  Text(
                    'CALENDARIO',
                    style: TextStyle(
                      fontFamily: 'Castoro',
                      fontSize: 15.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ) ],
              ),),
              VerticalDivider(
              color: Colors.black12,

                thickness: 5,
                indent: 20,
                endIndent: 20,
                width: 20,
              ),

              Expanded(child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(

                      icon: const Icon(Icons.contact_page_outlined),
                    iconSize: 100.0,
                    onPressed: () {},
                  ),
                  Text(
                    'CONTACTO PERSONAL',
                    style: TextStyle(
                      fontFamily: 'Castoro',
                      fontSize: 15.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ) ],
              ),
              ),
            ],
          )),

        ],
      )
    );
  }
}

