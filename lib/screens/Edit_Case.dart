import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class EditCase extends StatefulWidget {



  QueryDocumentSnapshot<Map<String, dynamic>> docToEdit;
  EditCase({required this.docToEdit});

  @override
  _EditCaseState createState() => _EditCaseState();
}

class _EditCaseState extends State<EditCase> {

  TextEditingController contratante = TextEditingController();
  TextEditingController contraparte = TextEditingController();
  TextEditingController radicado = TextEditingController();
  TextEditingController fechainicio = TextEditingController();
  TextEditingController dependencia = TextEditingController();
  TextEditingController tipoproceso = TextEditingController();
  TextEditingController etapaprocesal = TextEditingController();
  TextEditingController mediocontratante = TextEditingController();
  TextEditingController mediocontraparte = TextEditingController();
  TextEditingController mediodependencia = TextEditingController();

  @override
  void initState() {
    contratante = TextEditingController(text: widget.docToEdit.data()['contratante']);
    contraparte = TextEditingController(text: widget.docToEdit.data()['contraparte']);
    radicado = TextEditingController(text: widget.docToEdit.data()['radicado']);
    fechainicio = TextEditingController(text: widget.docToEdit.data()['fechainicio']);
    dependencia = TextEditingController(text: widget.docToEdit.data()['dependencia']);
    tipoproceso = TextEditingController(text: widget.docToEdit.data()['tipoproceso']);
    etapaprocesal = TextEditingController(text: widget.docToEdit.data()['etapaprocesal']);
    mediocontraparte = TextEditingController(text: widget.docToEdit.data()['mediocontraparte']);
    mediocontratante = TextEditingController(text: widget.docToEdit.data()['mediocontratante']);
    mediodependencia = TextEditingController(text: widget.docToEdit.data()['mediodependencia']);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.red),
        backgroundColor: Colors.amber[100],
        title: Text('Editar Caso',
          style: TextStyle(
            fontFamily: 'Castoro',
            color: Colors.black,
            fontWeight: FontWeight.bold,

          ),),
        actions: [
          TextButton(onPressed: () {
            showDialog(context: context,
              builder: (context) => AlertDialog(
                title: Text('Modificar Caso'),
                content: Text('Está seguro que desea modificar el caso?'),
                actions: <Widget>[
                  TextButton(onPressed: (){
                    widget.docToEdit.reference.update({
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

                    Navigator.pushNamed(context, 'ListPage');

                  },
                    child: Text('OK'),
                  ),
                  TextButton(onPressed:(){ Navigator.pop(context);}, child: Text('NO'))

                ],

              ),
            );






          }, child:
          Text('Guardar',
            style: TextStyle(
            fontFamily: 'Castoro',
            color: Colors.black,
            fontWeight: FontWeight.bold,

          ),)),

          TextButton(onPressed: (){
            showDialog(context: context,
                builder: (context) => AlertDialog(
                  title: Text('Borrar Caso'),
                  content: Text('Está seguro que desea borrar el caso?'),
                  actions: <Widget>[
                    TextButton(onPressed: (){
                widget.docToEdit.reference.delete().whenComplete(() => Navigator.pushNamed(context, 'ListPage'));

                },
                        child: Text('OK'),
                    ),
                    TextButton(onPressed:(){ Navigator.pop(context);}, child: Text('NO'))

                  ],

                ),
            );
          },
    child: Text('Borrar',
      style: TextStyle(
        fontFamily: 'Castoro',
        color: Colors.black,
        fontWeight: FontWeight.bold,

      ),)
    ),


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
