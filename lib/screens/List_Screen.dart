import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lawyer_assist/screens/Edit_Case.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final ref = FirebaseFirestore.instance.collection('Documentos');

  final FirebaseAuth auth = FirebaseAuth.instance;
  List<Map<String, dynamic>> documUsuario =
      List<Map<String, dynamic>>.empty(growable: true);
  late User userlogged;

  @override
  void initState() {
    userlogged = auth.currentUser!;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.amber[100],
        title: Center(
          child: Text(
            'Lista de Casos',
            style: TextStyle(
              fontFamily: 'KaushanScript',
              fontSize: 40.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, 'AddCase');
        },
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: ref.snapshots(),
          builder: (context, snapshot) {
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              if (snapshot.data!.docs[i]['correito'] == userlogged.uid) {
                documUsuario.add(snapshot.data!.docs[i].data());
                print(snapshot.data?.docs[i].data());
              }
            }
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: documUsuario.isNotEmpty ? documUsuario.length : 0,
                itemBuilder: (_, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => EditCase(
                                    docToEdit: snapshot.data!.docs[index],
                                  )));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10)),
                      margin: EdgeInsets.all(20),
                      height: 150,
                      child: Column(
                        children: [

                          Text('Nombre Contratante:'),
                          Text(
                              snapshot.data!.docs[index].data()['contratante']),
                          const SizedBox(height: 10),
                          Text('Radicado:'),
                          Text(snapshot.data!.docs[index].data()['radicado']),
                        ],
                      ),
                    ),
                  );
                });
          }),
    );
  }
}
