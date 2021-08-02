import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ViewCase extends StatelessWidget {

  static final TextEditingController contratante = TextEditingController();
  static final TextEditingController contraparte = TextEditingController();
  static final TextEditingController radicado = TextEditingController();
  static final TextEditingController fechainicio = TextEditingController();
  static final TextEditingController dependencia = TextEditingController();
  static final TextEditingController tipoproceso = TextEditingController();
  static final TextEditingController etapaprocesal = TextEditingController();
  static final TextEditingController mediocontratante = TextEditingController();
  static final TextEditingController mediocontraparte = TextEditingController();
  static final TextEditingController mediodependencia = TextEditingController();

  CollectionReference ref = FirebaseFirestore.instance.collection('Documentos');



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[100],
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Añadir Caso'),
        actions: [
          TextButton(onPressed: () {


            ref.add({
              'contratante': contratante.text,
              'contraparte': contraparte.text,
              'radicado': radicado.text,
              'fechainicio': fechainicio.text,
              'dependencia': dependencia.text,
              'tipoproceso': tipoproceso.text,
              'etapaprocesal': etapaprocesal.text,
              'mediocontratante': mediocontratante.text,
              'mediocontraparte': mediocontraparte.text,
              'mediodependencia': mediodependencia.text,
            });
            contratante.clear();
            contraparte.clear();
            radicado.clear();
            fechainicio.clear();
            dependencia.clear();
            tipoproceso.clear();
            etapaprocesal.clear();
            mediocontratante.clear();
            mediocontraparte.clear();
            mediodependencia.clear();
            Navigator.pop(context);




          }, child:
          Text('Guardar'))
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
                  controller: contratante,
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
                  controller: contraparte,
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
                  controller: radicado,
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
                  controller: fechainicio,
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
                  controller: dependencia,
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
                  controller: tipoproceso,
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
                  controller: etapaprocesal,
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
                  controller: mediocontratante,
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
                  controller: mediocontraparte,
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
                  controller: mediodependencia,
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
