import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_login_demo/pages/home_Cadastro.dart';
import 'package:flutter_login_demo/pages/crud.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'dart:async';
import 'package:date_field/date_field.dart';
import 'dart:io';
import 'dart:ui';



 class HistoricoA  extends StatelessWidget{
   var doc;
 var item;
 var exp;
 var view;
 var id;


    crudMedthods crudObj = new crudMedthods();
    Cadastro upObj = new Cadastro();

  
   
    Widget build(BuildContext context){
     var snapshots = Firestore.instance
      .collection('PACIENTE')
      .snapshots(); 
      
          
         return Scaffold(
               appBar: AppBar(
                 backgroundColor: Colors.teal,
                  title: Text('Histórico Ficha A (Cadastro)'),

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
                            title: Text(doc['Nome']?? ""),
                              
                            subtitle: Text(doc['Cnsn']?? ""),
                            onTap: () async { 
                                       var  docfinal;
                                         
                                          print("doc" + snapshot.data.documents[i].documentID);
                                         
                                          
                                          id = await Firestore.instance.document('PACIENTE/${snapshot.data.documents[i].documentID}').get();
                                          
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
 
                                     upObj.createState().updateDialog(context,snapshot.data.documents[i].documentID);
                                    
                            }
                             

                            
                            
                            ),
                             IconButton(
                            icon: Icon(Icons.delete), 
                            
                            onPressed: () {

                              crudObj.deleteData(snapshot.data.documents[i].documentID);
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

             alignment: Alignment.centerLeft,

              child:  SingleChildScrollView(
        child: Column(
              
              crossAxisAlignment: CrossAxisAlignment.stretch,

               mainAxisSize: MainAxisSize.max,
               mainAxisAlignment: MainAxisAlignment.start,


              children: <Widget>[
              Text("Nome:  " + docfinal['Nome'].toString()?? ""),
              Text("Cns:  " + docfinal['Cnsn'].toString()?? ""),
              Text("Nome da Mãe:  " + docfinal['mae'].toString()?? ""),              
              Text("Nacionalidade:  " + docfinal['nacionalidade'].toString()?? ""),
              Text("Sexo:  " + docfinal['Sexo'].toString()?? ""),
              Text("Data de Nasc:  " + docfinal['Data de Nascimento'].toString()?? ""),
              Text("Moradia:  " + docfinal['Moradia'].toString()?? ""),
              Text("Energia:  " + docfinal['Energia'].toString()?? ""),
              Text("Destino Lixo:  " + docfinal['Destino Lixo'].toString()?? ""),
              Text("Tratamento de água:  " + docfinal['Tratamento de agua'].toString()?? ""),
              Text("Abastecimento:  " + docfinal['Abastecimento'].toString()?? ""),
              Text("Esgoto:  " + docfinal['Esgoto'].toString()?? ""),
              Text("Uf:  " + docfinal['Uf'].toString()?? ""),
              Text("Raça:  " + docfinal['Raça'].toString()?? ""),
              Text("Endereço:  " + docfinal['Endereço'].toString()?? ""),
              Text("Nº Residencial:  " + docfinal['Numero Residencial'].toString()?? ""),
              Text("Cep:  " + docfinal['Cep'].toString()?? ""),
              Text("Bairro:  " + docfinal['Bairro'].toString()?? ""),
              Text("Nº Comodos:  " + docfinal['Nº Comodos'].toString()?? ""),
              Text("Nome do Plano:  " + docfinal['Nome do Plano'].toString()?? ""),
              Text("Possui Plano:  " + docfinal['Alguem Possui Plano'].toString()?? ""),
              Text("Grupos comunitários:  " + docfinal['Participa de grupos comunitários'].toString()?? ""),
              Text("Quando doente procura:  " + docfinal['Em caso de doença procura'].toString()?? ""),
              Text("Meio de transporte:  " + docfinal['Meio de trasporte'].toString()?? ""),
              Text("Nº de pessoas plano:  " + docfinal['Quantas pessoas utilizam o plano'].toString()?? ""),



               FlatButton(
                 child: Text('Voltar'),
                 textColor: Colors.blue,
                 onPressed: (){
                        Navigator.of(context).pop();
                 }
                 
               
                 ),
                 
                        ],
                         
           ),
                
                
           )
           )
         );

         
           
             
   }


      );


}



 }

