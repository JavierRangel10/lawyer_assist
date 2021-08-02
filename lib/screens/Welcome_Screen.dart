import 'package:flutter/material.dart';



class WelcomeScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.grey[850],
          body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: <Widget>[
                  CircleAvatar(
                    radius: 80.0,
                    backgroundImage: AssetImage('images/ley.jpg'),

                  ),
                  Text(
                    'Lawyer Assistant',
                    style: TextStyle(
                      fontFamily: 'KaushanScript',
                      fontSize: 35.0,
                      color: Colors.amber[50],
                      fontWeight: FontWeight.bold,

                    ),
                  ),
                  const SizedBox(height: 30),

                  ElevatedButton(


                    onPressed: () {
                      Navigator.pushNamed(context, 'LoginScreen');
                    },
                    child: const Text('Iniciar Sesion',
                      style: TextStyle(
                        fontFamily: 'Castoro',
                        fontSize: 15.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  SizedBox(height: 5),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'RegistrationScreen');
                      },
                      child: const Text('Registrarse',
                        style: TextStyle(
                          fontFamily: 'Castoro',
                          fontSize: 15.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                  )






                ],
              ),
            ),
          ),

        )
    );

  }
}