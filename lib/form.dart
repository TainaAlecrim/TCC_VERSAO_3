import 'package:flutter/material.dart';
import 'package:flutter_login_demo/pages/crud.dart';
import 'package:flutter_login_demo/pages/multi_form_obitos.dart';
import 'package:flutter_login_demo/user.dart';

typedef OnDelete();

class UserForm extends StatefulWidget {
  final User user;
  final state = _UserFormState();
  final OnDelete onDelete;

  UserForm({Key key, this.user, this.onDelete}) : super(key: key);
  @override
  _UserFormState createState() => state;
}

class _UserFormState extends State<UserForm> {
  final form = GlobalKey<FormState>();

  crudMedthods crudObj = new crudMedthods();

  String Nome;
  String Data;
  String Idade;
  String Causa;
  String NomeHospital;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Material(
        elevation: 1,
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(8),
        child: Form(
          key: form,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              AppBar(
                elevation: 0,
                title: Text('Obitos'),
                backgroundColor: Theme.of(context).accentColor,
                centerTitle: true,
                actions: <Widget>[
                  FlatButton(
                      child: Text('Salvar'),
                      textColor: Colors.white,
                      onPressed: () {
                        showAlertDialog1(BuildContext context) {
                          Navigator.of(context).pop();
                          // configura o button
                          /*Widget okButton = FlatButton(
                            child: Text("OK"),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MultiFormObitos() ),
                              );
                             //Navigator.pop(context);
                            },
                          );
                          // configura o  AlertDialog
                          AlertDialog alerta = AlertDialog(
                            title: Text("Salvo com sucesso!"),
                            content:
                                Text("Sua operação foi salva com sucesso."),
                            actions: [
                              okButton,
                            ],
                          );
                          // exibe o dialog
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return alerta;
                            },
                          );*/
                        }

                        showAlertDialog1(context);
                        Map<String, dynamic> Obitos = {
                          //firebase_UserFormState UserFormHosp

                          //'Data': Navigator.pushNamed(context, '/user'),
                          //'Nome': this.widget.user.fullNamefh ,
                          'Nome': this.Nome,
                          'Data': this.Data,
                          'Idade': this.Idade,
                          'Causa': this.Causa,
                          'Nome do Hospital': this.NomeHospital,
                        };
                        crudObj
                            .addObitos(Obitos)
                            .then((result) {
                          dialogTrigger(context);
                        }).catchError((e) {});
                      }),
                  /* IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: widget.onDelete,
                  )*/
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, bottom: 1),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Data',
                    hintText: 'Ex: xx/xx/xxxx',
                    icon: Icon(Icons.person_pin),
                    isDense: true,
                  ),
                  onChanged: (value) {
                    this.Data = value;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 1),
                child: TextFormField(
                  //initialValue: this.widget.user.fullNamefh,
                  decoration: InputDecoration(
                    labelText: 'Nome completo',
                    hintText: 'Ex: Taina Alecrim',
                    icon: Icon(Icons.person),
                    //isDense: true,
                  ),
                  onChanged: (value) {
                    this.Nome = value;
                  },
                ),
              ),
              /*Padding(
                                padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                                child: TextFormField(
                                  initialValue: widget.user.endereco,
                                  decoration: InputDecoration(
                                    labelText: 'Endereço',
                                    hintText: 'Ex: Rua Silva',
                                    icon: Icon(Icons.home),
                                    isDense: true,
                                  ),
                                ),
                              ),*/
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, bottom: 1),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Idade',
                    hintText: 'Ex: 19',
                    icon: Icon(Icons.person_pin),
                    isDense: true,
                  ),
                  onChanged: (value) {
                    this.Idade = value;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, bottom: 1),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Causa',
                    hintText: 'Ex: Pneamunia',
                    icon: Icon(Icons.local_hospital),
                    isDense: true,
                  ),
                  onChanged: (value) {
                    this.Causa = value;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, bottom: 1),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Nome do Hospital',
                    hintText: 'Ex: Sorocabana',
                    icon: Icon(Icons.local_hospital),
                    isDense: true,
                  ),
                  onChanged: (value) {
                    this.NomeHospital = value;
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void dialogTrigger(BuildContext context) {}

  ///form validator
  /*bool validate() {
    var valid = form.currentState.validate();
    if (valid) form.currentState.save();
    return valid;
  }*/
}
