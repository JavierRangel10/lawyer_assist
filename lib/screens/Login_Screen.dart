import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String  _email = '';
  String  _password = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.amber[50],
          body: ModalProgressHUD(
            inAsyncCall: showSpinner,
            child: SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: <Widget>[
                      Text(
                        'Iniciar Sesion',
                        style: TextStyle(
                          fontFamily: 'KaushanScript',
                          fontSize: 35.0,
                          color: Colors.black45,
                          fontWeight: FontWeight.bold,

                        ),
                      ),
                      const SizedBox(height: 30),





                      Padding(
                        padding: const EdgeInsets.only(left: 40, right: 40, bottom: 20),
                        child: TextField(
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value){
                            _email = value;
                          },
                          decoration: new InputDecoration(
                            prefixIcon: Icon(Icons.email_outlined),
                            border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                    const Radius.circular(50.0)
                                )
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black, width: 5.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey, width: 5.0),
                            ),
                            hintText: 'Email',
                          ),
                          style: TextStyle(
                              color: Colors.black
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 40, right: 40, bottom: 20),
                        child: TextField(
                          textAlign: TextAlign.center,
                          obscureText: true,
                          onChanged: (value){
                            _password = value;
                          },

                          decoration: new InputDecoration(
                            prefixIcon: Icon(Icons.lock_outlined),
                            border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                    const Radius.circular(50.0)
                                )
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black, width: 5.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey, width: 5.0),
                            ),
                            hintText: 'Contraseña',
                          ),
                          style: TextStyle(
                              color: Colors.black
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blueGrey[800],
                        ),


                        onPressed: () async {
                          setState(() {
                            showSpinner = true;
                          });


                          try {
                            print('hola');


                            final UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                              email: _email,
                              password: _password
                            );
                            if (userCredential != null){
                              Navigator.pushNamed(context, 'Home');
                            }
                            setState(() {
                              showSpinner = false;
                            });
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              print('No user found for that email.');
                            } else if (e.code == 'wrong-password') {
                              print('Wrong password provided for that user.');
                            }
                          } catch (e) {
                            print(e);
                          }
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



                    ],
                  ),
                ),
              ),
            ),
          ),

        )
    );
  }
}
