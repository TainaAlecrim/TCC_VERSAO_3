import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_login_demo/pages/home_Cadastro.dart';
import 'package:flutter_login_demo/pages/crud.dart';
import 'package:flutter_login_demo/pages/home_fichad.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'dart:async';
import 'package:date_field/date_field.dart';
import 'dart:io';
import 'dart:ui';



 class HistoricoD  extends StatelessWidget{
   var doc;
 var item;
 var exp;
 var view;
 var id;


    crudMedthods crudObj = new crudMedthods();
    Cadastro upObj = new Cadastro();
    FichaD upObj2 = new FichaD();

  
   
    Widget build(BuildContext context){
     var snapshots = Firestore.instance
      .collection('FICHAD')
      .snapshots(); 
      
          
         return Scaffold(
               appBar: AppBar(
                  title: Text('Histórico Ficha D (Ficha Diária)'),
                  backgroundColor: Colors.teal,
               ),
               body: StreamBuilder(
                 stream: snapshots,
                 builder: (
                    BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot,
                    ){

                      if(snapshot.hasError){
                        return Center(child: Text('Error: ${snapshot.error}'));
                      }

                      if(snapshot.connectionState == ConnectionState.waiting){
                        return Center(child: CircularProgressIndicator());
                      }

                      if(snapshot.data.documents.length == 0){
                        return Center(child: Text('Nenhuma tarefa Ainda' ));
                      }

                       return ListView.builder(
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (BuildContext context, int i){
                         
                          doc = snapshot.data.documents[i];
                          exp = snapshot.data.documents[i].documentID;
                         
                           item = snapshot.data.documents[i].data;

                           


                          return Container(
                             color:Colors.white,
                             margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                          
                          child: ListTile(
                            title: Text(doc['Nome do Profissional']?? ""),
                              
                            subtitle: Text(doc['Cns do profissional']?? ""),
                            onTap: () async { 
                                       var  docfinal;
                                         
                                          print("doc" + snapshot.data.documents[i].documentID);
                                         
                                          
                                          id = await Firestore.instance.document('FICHAD/${snapshot.data.documents[i].documentID}').get();
                                          
                                         print(id.data?? "");
                                         docfinal = id.data;
                                         viewDialog(context,snapshot.data.documents[i].documentID , docfinal);
                                },
                          
                           
                              trailing: Container(
                              width:100,
                              child: Row(children: <Widget>[
                                
                            IconButton(
                            icon: Icon(Icons.edit), 
                            color: Colors.black,
                            onPressed: () {
 
                                     upObj2.createState().updateDialog2(context,snapshot.data.documents[i].documentID);
                                    
                            }
                             

                            
                            
                            ),
                             IconButton(
                            icon: Icon(Icons.delete), 
                            
                            onPressed: () {

                              crudObj.deleteData2(snapshot.data.documents[i].documentID);
                            }

                            ),
                            ],)
                            ),
                          ),
                            );
                        }
                       );

                    }
                      ),


 
         );
    }


   

      Future<bool> viewDialog(BuildContext context, selectedDoc, docfinal)  {
      return showDialog(
       context: context,
       barrierDismissible: false,
       builder: (BuildContext context){
         return AlertDialog(
           title: Text('Visualizar', style: TextStyle(fontSize: 15.0)),
           shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.all(Radius.circular(20.0))),
           content:  Container(
               
             
              child:  SingleChildScrollView(
        child: Column(
               mainAxisSize: MainAxisSize.min,
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               crossAxisAlignment: CrossAxisAlignment.stretch,


              children: <Widget>[
              Text("Nome:  " + docfinal['Nome do Profissional'].toString()?? ""),
              Text("Cns:  " + docfinal['Cns do profissional'].toString()?? ""),
              Text("Segmento:  " + docfinal['Segmento'].toString()?? ""),              
              Text("Unidade:  " + docfinal['unidade'].toString()?? ""),
              Text("Area:  " + docfinal['Area'].toString()?? ""),
              Text("Micro Area:  " + docfinal['Micro Area'].toString()?? ""),
              Text("Municiopio:  " + docfinal['Municiopio'].toString()?? ""),
              Text("Atendimento Especifico para AT:  " + docfinal['Atendimento Especifico para AT'].toString()?? ""),
              Text("Visita de inspeção sanitária:  " + docfinal['Visita de inspeção sanitária'].toString()?? ""),
              Text("Atend/individual/prof.nivel/superior:  " + docfinal['Atend/individual/prof.nivel/superior'].toString()?? ""),
              Text("Curativos:  " + docfinal['Curativos'].toString()?? ""),
              Text("Inalação:  " + docfinal['Inalação'].toString()?? ""),
              Text("Injeções:  " + docfinal['Injeções'].toString()?? ""),
              Text("Retiradas de pontos:  " + docfinal['Retiradas de pontos'].toString()?? ""),
              Text("Sutura:  " + docfinal['Sutura'].toString()?? ""),
              Text("Atend/grupo/educ.em saude:  " + docfinal['Atend/grupo/educ.em saude'].toString()?? ""),
              Text("Procedimentos coleticos (PCI):  " + docfinal['Procedimentos coleticos (PCI)'].toString()?? ""),
              Text("Reuniões:  " + docfinal['reuniões'].toString()?? ""),
              Text("Visita domiciliar:  " + docfinal['Visita domociliar'].toString()?? ""),
              Text("Terapia de reidratação oral:  " + docfinal['Terapia de reidratação oral'].toString()?? ""),
              Text("Menores de 2 anos com diarreia:  " + docfinal['Menores de 2 anos com diarreia'].toString()?? ""),
              Text("<2 anos com diarreia e usaram TRO:  " + docfinal['<2 anos com diarreia e usaram TRO'].toString()?? ""),
              Text("<2 anos com infecção respiratória aguda:  " + docfinal['<2 anos com infecção resperatória aguda'].toString()?? ""),
              Text("<5 anos que tiveram pneumonia:  " + docfinal['<5 anos que tiveram pneamunia'].toString()?? ""),
              Text("Acidente Cardiovascular:  " + docfinal['Acidente Cardiovascular'].toString()?? ""),
              Text("Infarto agudo do miocardio:  " + docfinal['Infarto Agudo da miocardia'].toString()?? ""),
              Text("DHEG (forma grave):  " + docfinal['DHEG (forma grave)'].toString()?? ""),



               FlatButton(
                 child: Text('Voltar'),
                 textColor: Colors.blue,
                 onPressed: (){
                        Navigator.of(context).pop();
                 }
                 
               
                 )
                 
                        ],
                         
           ),
                
                
           )
           )
         );

         
           
             
   }


      );


}



 }

 

