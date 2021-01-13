import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';


class crudMedthods {

Future<void> addData(CadastroData) async {

   Firestore.instance.collection('PACIENTE').add(CadastroData).catchError((e){
          print(e);

   });
}

getData() async{

 return await Firestore.instance.collection('PACIENTE').snapshots();

}

updateData( selectedDoc,newvalues){
         Firestore.instance
         .collection('PACIENTE')
         .document(selectedDoc)
         .updateData(newvalues)
         .catchError((e){
         print(e);
         });


}

deleteData(docId){
  Firestore.instance.
  collection('PACIENTE')
  .document(docId)
  .delete()
  .catchError((e){
    print(e); 
  });
}

viewData(selectedDoc, ){
    Firestore.instance
    .collection('PACIENTE')
    .document(selectedDoc).snapshots();



}

Future<void> addFicha(FichaD) async {

   Firestore.instance.collection('FICHAD').add(FichaD).catchError((e){
          print(e);

   });
}

getData2() async{

 return await Firestore.instance.collection('FICHAD').snapshots();

}

updateData2( selectedDoc,newvalues){
         Firestore.instance
         .collection('FICHAD')
         .document(selectedDoc)
         .updateData(newvalues)
         .catchError((e){
         print(e);
         });


}

deleteData2(docId){
  Firestore.instance.
  collection('FICHAD')
  .document(docId)
  .delete()
  .catchError((e){
    print(e); 
  });
}

viewData2(selectedDoc, ){
    Firestore.instance
    .collection('FICHAD')
    .document(selectedDoc).snapshots();



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