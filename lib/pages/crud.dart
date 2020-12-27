import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';


class crudMedthods {

Future<void> addData(CadastroData) async {

   Firestore.instance.collection('PACIENTE').add(CadastroData).catchError((e){
          print(e);

   });
}

Future<void> addFicha(FichaD) async {

   Firestore.instance.collection('FICHAD').add(FichaD).catchError((e){
          print(e);

   });
}

Future<void> addHospitalizacoes(Hospitalizacoes) async {

   Firestore.instance.collection('Hospitalizacoes').add(Hospitalizacoes).catchError((e){
          print(e);

   });
}

Future<void> addObitos(Obitos) async {

   Firestore.instance.collection('OBITOS').add(Obitos).catchError((e){
          print(e);

   });
}

}