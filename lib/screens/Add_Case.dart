import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:intl/intl.dart';


class AddCase extends StatefulWidget {




  @override
  _AddCaseState createState() => _AddCaseState();
}

class _AddCaseState extends State<AddCase> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore _Firestore = FirebaseFirestore.instance;

  String? contratante;
  String? contraparte;
  String? radicado;
  String? fechainicio;
  String? dependencia;
  String? tipoproceso;
  String? etapaprocesal;
  String? mediocontratante;
  String? mediocontraparte;
  String? mediodependencia;
  String? correito;
  late DateTime diacita;


  User? userlogged;

  CollectionReference ref = FirebaseFirestore.instance.collection('Documentos');

  CollectionReference ref2 = FirebaseFirestore.instance.collection('Users');

  @override
  void initState() {
    userlogged = auth.currentUser!;
    diacita = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.amber[100],
        title: Text('Añadir Caso',
          style: TextStyle(
            fontFamily: 'Castoro',
            color: Colors.black,
            fontWeight: FontWeight.bold,

          ),),
        actions: [
          TextButton(onPressed: () {
            _Firestore.collection('Documentos').add({
              'contratante': contratante,
              'contraparte': contraparte,
              'radicado': radicado,
              'fechainicio': fechainicio,
              'dependencia': dependencia,
              'tipoproceso': tipoproceso,
              'etapaprocesal': etapaprocesal,
              'mediocontratante': mediocontratante,
              'mediocontraparte': mediocontraparte,
              'mediodependencia': mediodependencia,
              'correito': userlogged?.uid,





            });
            Navigator.pushNamed(context,'ListPage');




          }, child:
          Text('Guardar',
            style: TextStyle(
              fontFamily: 'Castoro',
              color: Colors.black,
              fontWeight: FontWeight.bold,

            ),))
        ],


      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Nombre Contratante:',
                style: TextStyle(
                  fontFamily: 'KaushanScript',
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,

                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, bottom: 20),
              child: Container(
                decoration: BoxDecoration(border: Border.all()),
                child: TextField(
                  onChanged: (value) {
                    contratante = value;
                  },
                  decoration: InputDecoration(hintText: 'Nombre Contratante'),
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Nombre Contraparte:',
                style: TextStyle(
                  fontFamily: 'KaushanScript',
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,

                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, bottom: 20),
              child: Container(
                decoration: BoxDecoration(border: Border.all()),
                child: TextField(
                  onChanged: (value) {
                    contraparte = value;
                  },
                  decoration: InputDecoration(hintText: 'Nombre Contraparte'),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Radicado:',
                style: TextStyle(
                  fontFamily: 'KaushanScript',
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,

                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, bottom: 20),
              child: Container(
                decoration: BoxDecoration(border: Border.all()),
                child: TextField(
                  onChanged: (value) {
                    radicado = value;
                  },
                  decoration: InputDecoration(hintText: '(Si lo hay)'),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Fecha Inicio:',
                style: TextStyle(
                  fontFamily: 'KaushanScript',
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,

                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, bottom: 20),
              child: Container(
                decoration: BoxDecoration(border: Border.all()),
                child: TextField(
                  onChanged: (value) {
                    fechainicio = value;
                  },
                  decoration: InputDecoration(hintText: 'ARREGLAR ESTO'),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Dependencia Encargada:',
                style: TextStyle(
                  fontFamily: 'KaushanScript',
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,

                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, bottom: 20),
              child: Container(
                decoration: BoxDecoration(border: Border.all()),
                child: TextField(
                    onChanged: (value) {
                      dependencia = value;
                    },
                  decoration: InputDecoration(hintText: '(Si la hay)'),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Tipo de Proceso:',
                style: TextStyle(
                  fontFamily: 'KaushanScript',
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,

                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, bottom: 20),
              child: Container(
                decoration: BoxDecoration(border: Border.all()),
                child: TextField(
                  onChanged: (value) {
                    tipoproceso = value;
                  },
                  decoration: InputDecoration(hintText: 'Tipo de proceso'),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Etapa Procesal:',
                style: TextStyle(
                  fontFamily: 'KaushanScript',
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,

                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, bottom: 20),
              child: Container(
                decoration: BoxDecoration(border: Border.all()),
                child: TextField(
                  onChanged: (value) {
                    etapaprocesal = value;
                  },
                  decoration: InputDecoration(hintText: 'Etapa procesal'),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Medios de Notificacion:',
                style: TextStyle(
                  fontFamily: 'KaushanScript',
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,

                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Contratante',
                style: TextStyle(
                  fontFamily: 'KaushanScript',
                  fontSize: 17.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,

                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, bottom: 20),
              child: Container(
                decoration: BoxDecoration(border: Border.all()),
                child: TextField(
                  onChanged: (value) {
                    mediocontratante = value;
                  },
                  decoration: InputDecoration(hintText: 'Medios para Contratante'),
                  maxLines: 5,
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Contraparte:',
                style: TextStyle(
                  fontFamily: 'KaushanScript',
                  fontSize: 17.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,

                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, bottom: 20),
              child: Container(
                decoration: BoxDecoration(border: Border.all()),
                child: TextField(
                  onChanged: (value) {
                    mediocontraparte = value;
                  },
                  decoration: InputDecoration(hintText: '(Si la hay)'),
                  maxLines: 5,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Dependencia',
                style: TextStyle(
                  fontFamily: 'KaushanScript',
                  fontSize: 17.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,

                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, bottom: 20),
              child: Container(
                decoration: BoxDecoration(border: Border.all()),
                child: TextField(
                  onChanged: (value) {
                    mediodependencia = value;
                  },
                  decoration: InputDecoration(hintText: '(Si la hay)'),
                  maxLines: 5,
                ),

              ),

            ),


          ],
        ),
      ),

    );
  }
}
















  