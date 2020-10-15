import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter_login_demo/pages/crud.dart';
import 'package:flutter_login_demo/pages/home_page.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'dart:async';
import 'package:date_field/date_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';

class FichaD extends StatefulWidget {
  @override
  _StepperState createState() => _StepperState();
}

class _StepperState extends State<FichaD> {
  TextEditingController _controller = TextEditingController();
  TextEditingController _controller1 = TextEditingController(); 
  TextEditingController _controller2 = TextEditingController(); /// CRIAR UM CONTROLER PRA CADA BAGULHO
  TextEditingController _controller3 = TextEditingController(); 
  TextEditingController _controller4 = TextEditingController(); 
  TextEditingController _controller5 = TextEditingController(); 
  TextEditingController _controller6 = TextEditingController(); 
  TextEditingController _controller7 = TextEditingController(); 
  TextEditingController _controller8 = TextEditingController(); 
  TextEditingController _controller9 = TextEditingController(); 
  TextEditingController _controller10 = TextEditingController();
  TextEditingController _controller11 = TextEditingController(); 
  TextEditingController _controller12 = TextEditingController(); 
  TextEditingController _controller13 = TextEditingController(); 
  TextEditingController _controller14 = TextEditingController(); 
  TextEditingController _controller15 = TextEditingController(); 
  TextEditingController _controller16 = TextEditingController(); 
  TextEditingController _controller17 = TextEditingController(); 
  TextEditingController _controller18 = TextEditingController();
  TextEditingController _controller19 = TextEditingController();  


  String Segmentof;
  String CNSdoProfissional;
  String Unidadef;
  String Areaf;
  String Microareaf;
  String Profissionalf;
  String _municiopiof;
  String input1;
  


  @override
  void initState() {
    super.initState();
    _controller.text = "0"; 
    _controller1.text = "0";
    _controller2.text = "0";
    _controller3.text = "0";
    _controller4.text = "0";
    _controller5.text = "0";
    _controller6.text = "0";
    _controller7.text = "0";
    _controller8.text = "0";
    _controller9.text = "0";
    _controller10.text = "0";
    _controller11.text = "0";
    _controller12.text = "0";
    _controller13.text = "0";
    _controller14.text = "0";
    _controller15.text = "0";
    _controller16.text = "0";
    _controller17.text = "0";
    _controller18.text = "0";
    _controller19.text = "0";
 

  }


  crudMedthods crudObj = new crudMedthods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: new GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Stack(children: <Widget>[_showForm()]),
      ),
    );
  }

  DateTime selectedData;
  Widget Datadoatendimento() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
        child: new DateField(
          label: 'Data do Atendimento',
          selectedDate: selectedData,
          decoration: new InputDecoration(
            hintText: 'Data do Atendimento',
            icon: new Icon(
              Icons.calendar_today,
              color: Colors.grey,
            ),
          ),
          onDateSelected: (DateTime value) {
            setState(() {
              selectedData = value;
            });
          },
          lastDate: DateTime.now(),
        ));
  }

  Widget CNSndoProfissional() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Cns do Profissional',
            icon: new Icon(
              Icons.card_membership,
              color: Colors.grey,
            )),
        validator: (value) =>
            value.isEmpty ? 'O campo CNS não pode ficar vazio' : null,
        onChanged: (value) {
          this.CNSdoProfissional = value;
        },
      ),
    );
  }


  Widget Segmento() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Segmento',
            icon: new Icon(
              Icons.local_hospital,
              color: Colors.grey,
            )),
        validator: (value) =>
            value.isEmpty ? 'O campo Segmento não pode ficar vazio' : null,
        onChanged: (value) {
          this.Segmentof = value;
        },
      ),
    );
  }

  Widget Unidade() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.text,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Unidade',
            icon: new Icon(
              Icons.local_hospital,
              color: Colors.grey,
            )),
        validator: (value) =>
            value.isEmpty ? 'O campo Unidade não pode ficar vazio' : null,
        onChanged: (value) {
          this.Unidadef = value;
        },
      ),
    );
  }

  Widget Area() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.text,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Area',
            icon: new Icon(
              Icons.location_on,
              color: Colors.grey,
            )),
        validator: (value) =>
            value.isEmpty ? 'O campo Area não pode ficar vazio' : null,
        onChanged: (value) {
          this.Areaf = value;
        },
      ),
    );
  }

  Widget Microarea() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: new TextFormField(
            maxLines: 1,
            keyboardType: TextInputType.number,
            autofocus: false,
            decoration: new InputDecoration(
                hintText: 'MicroÁrea',
                icon: new Icon(
                  Icons.location_on,
                  color: Colors.grey,
                )),
            validator: (value) =>
                value.isEmpty ? 'O campo NomeMae não pode ficar vazio' : null,
            onChanged: (value) {
              this.Microareaf = value;
            }));
  }

  Widget Profissional() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Nome do Profissional',
            icon: new Icon(
              Icons.person,
              color: Colors.grey,
            )),
        validator: (value) =>
            value.isEmpty ? 'O campo CNS não pode ficar vazio' : null,
        onChanged: (value) {
          this.Profissionalf = value;
        },
      ),
    );
  }

  DateTime _selectedDate;
  Widget DataDiaria() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
        child: DatePickerWidget(
          looping: false, // default is not looping
          firstDate: DateTime(1900, 01, 01),
          lastDate: DateTime(2100, 1, 1),
          initialDate: DateTime.now(),
          dateFormat: "dd-MMM-yyyy",
          locale: DateTimePickerLocale.pt_br,
          onChange: (DateTime newDate, _) => _selectedDate = newDate,
          pickerTheme: DateTimePickerTheme(
            itemTextStyle: TextStyle(color: Colors.black, fontSize: 14),
            dividerColor: Colors.black,
          ),
        ));
  }

  Widget Municipio() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Municipio',
            icon: new Icon(
              Icons.location_on,
              color: Colors.grey,
            )),
        validator: (value) =>
            value.isEmpty ? 'O campo Municiopio não pode ficar vazio' : null,
        onChanged: (value) {
          this._municiopiof = value;
        },
      ),
    );
  }

  Widget Cep() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 100, 0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.number,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Cep',
            icon: new Icon(
              Icons.confirmation_number,
              color: Colors.grey,
            )),
        validator: (value) =>
            value.isEmpty ? 'O campo NomeMae não pode ficar vazio' : null,
      ),
    );
  }


  Future<bool> dialogTrigger(BuildContext context) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Salvo'),
            content: Text('Registro Salvo com Sucesso'),
            actions: <Widget>[
              FlatButton(
                  child: Text('Certo'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  })
            ],
          );
        });
  }

  Widget _showForm() {
    return new PageView(
      children: <Widget>[
        Container(
            margin: new EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.1,
              right: MediaQuery.of(context).size.width * 0.1,
              top: MediaQuery.of(context).size.height * 0.0,
              bottom: MediaQuery.of(context).size.height * 0.1,
            ),
            padding: EdgeInsets.all(0.0),
            child: new Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                      margin: new EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.0,
                        right: MediaQuery.of(context).size.width * 0.10,
                        top: MediaQuery.of(context).size.height * 0.020,
                        bottom: MediaQuery.of(context).size.height * 0.0,
                      ),
                      height: 60,
                      alignment: Alignment.centerRight,
                      child: FlatButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Voltar",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.blue,
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        },
                      )),
                  Container(
                    margin: new EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.0,
                      bottom: MediaQuery.of(context).size.height * 0.0,
                    ),
                    child: Text(
                      "Ficha D",
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                        fontSize: 27,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  DataDiaria(),
                  Profissional(),
                  CNSndoProfissional(),
                  Segmento(),
                  Unidade(),
                  Row(children: [
                    Expanded(
                      child: Area(),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Microarea(),
                    )
                  ]),
                  Municipio(),
                ])),

        // CHAMAR TELA 2
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Column(children: <Widget>[
              // TITULO

              Container(
                margin: new EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.05,
                  bottom: MediaQuery.of(context).size.height * 0.0,
                ),
                child: Text(
                  "Registro de Atividades",
                  style: TextStyle(fontSize: 20),
                ),
              ),

              // IMPULT NUMEROS

              Container(
                padding: const EdgeInsets.all(20.0),
                alignment: Alignment.center,
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: new EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.0,
                        right: MediaQuery.of(context).size.width * 0.1,
                      ),
                      child: Text(
                        "Atendimento especifico para AT       ",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                        controller: _controller,
                        keyboardType: TextInputType.numberWithOptions(
                            decimal: false, signed: false),
                        inputFormatters: <TextInputFormatter>[
                          WhitelistingTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        MaterialButton(
                          minWidth: 5.0,
                          child: Icon(Icons.arrow_drop_up),
                          onPressed: () {
                            int currentValue = int.parse(_controller.text);

                            setState(() {
                              
                              currentValue++;

                              _controller.text = (currentValue)
                                  .toString(); // incrementing value
                            });
                          },
                        ),
                        MaterialButton(
                          minWidth: 5.0,
                          child: Icon(Icons.arrow_drop_down),
                          onPressed: () {
                            int currentValue = int.parse(_controller.text);

                            setState(() {
                              print("Setting state");

                              currentValue--;

                              _controller.text = (currentValue)
                                  .toString(); // decrementing value
                            });
                          },
                        ),
                      ],
                    ),
                    Spacer(
                      flex: 01,
                    )
                  ],
                ),
              ),

              // IMPULT NUMEROS 2

              Container(
                margin: new EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.0,
                  right: MediaQuery.of(context).size.width * 0.0,
                  top: MediaQuery.of(context).size.height * 0.0,
                  bottom: MediaQuery.of(context).size.height * 0.00,
                ),
                padding: const EdgeInsets.all(20.0),
                alignment: Alignment.centerRight,
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: new EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.0,

                        right: MediaQuery.of(context).size.width * 0.1,

                        top: MediaQuery.of(context).size.height * 0.0,

                        // bottom: MediaQuery.of(context).size.height * 0.0,
                      ),
                      child: Text(
                        "Visita de inspeção sanitária              ",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                        controller: _controller1,
                        keyboardType: TextInputType.numberWithOptions(
                            decimal: false, signed: false),
                        inputFormatters: <TextInputFormatter>[
                          WhitelistingTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        MaterialButton(
                          minWidth: 5.0,
                          child: Icon(Icons.arrow_drop_up),
                          onPressed: () {
                            int currentValue1 = int.parse(_controller1.text);

                            setState(() {
                              currentValue1++;

                              this._controller1.text = (currentValue1)
                                  .toString(); // incrementing value
                            });
                          },
                        ),
                        MaterialButton(
                          minWidth: 5.0,
                          child: Icon(Icons.arrow_drop_down),
                          onPressed: () {
                            int currentValue1 = int.parse(_controller1.text);

                            setState(() {
                              
                              print("Setting state");

                              currentValue1--;

                              this._controller1.text = (currentValue1)
                                  .toString(); // decrementing value
                                  
                            });
                          },
                        ),
                      ],
                    ),
                    Spacer(
                      flex: 01,
                    )
                  ],
                  
                ),
              ),

              // IMPULT NUMEROS 3

              Container(
                margin: new EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.0,
                  right: MediaQuery.of(context).size.width * 0.0,
                  top: MediaQuery.of(context).size.height * 0.0,
                  bottom: MediaQuery.of(context).size.height * 0.00,
                ),
                padding: const EdgeInsets.all(20.0),
                alignment: Alignment.centerRight,
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: new EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.0,

                        right: MediaQuery.of(context).size.width * 0.1,

                        top: MediaQuery.of(context).size.height * 0.0,

                        // bottom: MediaQuery.of(context).size.height * 0.0,
                      ),
                      child: Text(
                        "Atend/individual/prof.nivel/superior",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                        controller: _controller2,
                        keyboardType: TextInputType.numberWithOptions(
                            decimal: false, signed: false),
                        inputFormatters: <TextInputFormatter>[
                          WhitelistingTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        MaterialButton(
                          minWidth: 5.0,
                          child: Icon(Icons.arrow_drop_up),
                          onPressed: () {
                            int currentValue2 = int.parse(_controller2.text);

                            setState(() {
                              currentValue2++;

                              _controller2.text = (currentValue2)
                                  .toString(); // incrementing value
                            });
                          },
                        ),
                        MaterialButton(
                          minWidth: 5.0,
                          child: Icon(Icons.arrow_drop_down),
                          onPressed: () {
                            int currentValue2 = int.parse(_controller2.text);

                            setState(() {
                              print("Setting state");

                              currentValue2--;

                              _controller2.text = (currentValue2)
                                  .toString(); // decrementing value
                            });
                          },
                        ),
                      ],
                    ),
                    Spacer(
                      flex: 01,
                    )
                  ],
                ),
              ),

              // IMPULT NUMEROS 2

              Container(
                padding: const EdgeInsets.all(20.0),
                alignment: Alignment.centerRight,
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: new EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.0,

                        right: MediaQuery.of(context).size.width * 0.1,

                        top: MediaQuery.of(context).size.height * 0.0,

                        // bottom: MediaQuery.of(context).size.height * 0.0,
                      ),
                      child: Text(
                        "Curativos                                              ",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                        controller: _controller3,
                        keyboardType: TextInputType.numberWithOptions(
                            decimal: false, signed: false),
                        inputFormatters: <TextInputFormatter>[
                          WhitelistingTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        MaterialButton(
                          minWidth: 5.0,
                          child: Icon(Icons.arrow_drop_up),
                          onPressed: () {
                            int currentValue3 = int.parse(_controller3.text);

                            setState(() {
                              currentValue3++;

                              _controller3.text = (currentValue3)
                                  .toString(); // incrementing value
                            });
                          },
                        ),
                        MaterialButton(
                          minWidth: 5.0,
                          child: Icon(Icons.arrow_drop_down),
                          onPressed: () {
                            int currentValue3 = int.parse(_controller3.text);

                            setState(() {
                              print("Setting state");

                              currentValue3--;

                              _controller3.text = (currentValue3)
                                  .toString(); // decrementing value
                            });
                          },
                        ),
                      ],
                    ),
                    Spacer(
                      flex: 01,
                    )
                  ],
                ),
              ),
            ]),
          ],
        ),
        // CHAMAR TELA 2
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Column(children: <Widget>[
              // TITULO

              Container(
                margin: new EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.05,
                  bottom: MediaQuery.of(context).size.height * 0.0,
                ),
                child: Text(
                  "Registro de Atividades",
                  style: TextStyle(fontSize: 20),
                ),
              ),

              // IMPULT NUMEROS

              Container(
                padding: const EdgeInsets.all(20.0),
                alignment: Alignment.center,
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: new EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.0,
                        right: MediaQuery.of(context).size.width * 0.1,
                      ),
                      child: Text(
                        "Inalações                                              ",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                        controller: _controller4,
                        keyboardType: TextInputType.numberWithOptions(
                            decimal: false, signed: false),
                        inputFormatters: <TextInputFormatter>[
                          WhitelistingTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        MaterialButton(
                          minWidth: 5.0,
                          child: Icon(Icons.arrow_drop_up),
                          onPressed: () {
                            int currentValue4 = int.parse(_controller4.text);

                            setState(() {
                              currentValue4++;

                              _controller4.text = (currentValue4)
                                  .toString(); // incrementing value
                            });
                          },
                        ),
                        MaterialButton(
                          minWidth: 5.0,
                          child: Icon(Icons.arrow_drop_down),
                          onPressed: () {
                            int currentValue4 = int.parse(_controller4.text);

                            setState(() {
                              print("Setting state");

                              currentValue4--;

                              _controller4.text = (currentValue4)
                                  .toString(); // decrementing value
                            });
                          },
                        ),
                      ],
                    ),
                    Spacer(
                      flex: 01,
                    )
                  ],
                ),
              ),

              // IMPULT NUMEROS 2

              Container(
                margin: new EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.0,
                  right: MediaQuery.of(context).size.width * 0.0,
                  top: MediaQuery.of(context).size.height * 0.0,
                  bottom: MediaQuery.of(context).size.height * 0.00,
                ),
                padding: const EdgeInsets.all(20.0),
                alignment: Alignment.centerRight,
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: new EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.0,

                        right: MediaQuery.of(context).size.width * 0.1,

                        top: MediaQuery.of(context).size.height * 0.0,

                        // bottom: MediaQuery.of(context).size.height * 0.0,
                      ),
                      child: Text(
                        "Injeções                                                ",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                        controller: _controller5,
                        keyboardType: TextInputType.numberWithOptions(
                            decimal: false, signed: false),
                        inputFormatters: <TextInputFormatter>[
                          WhitelistingTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        MaterialButton(
                          minWidth: 5.0,
                          child: Icon(Icons.arrow_drop_up),
                          onPressed: () {
                            int currentValue5 = int.parse(_controller5.text);

                            setState(() {
                              currentValue5++;

                              _controller5.text = (currentValue5)
                                  .toString(); // incrementing value
                            });
                          },
                        ),
                        MaterialButton(
                          minWidth: 5.0,
                          child: Icon(Icons.arrow_drop_down),
                          onPressed: () {
                            int currentValue5 = int.parse(_controller5.text);

                            setState(() {
                              print("Setting state");

                              currentValue5--;

                              _controller5.text = (currentValue5)
                                  .toString(); // decrementing value
                            });
                          },
                        ),
                      ],
                    ),
                    Spacer(
                      flex: 01,
                    )
                  ],
                ),
              ),

              // IMPULT NUMEROS 3

              Container(
                margin: new EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.0,
                  right: MediaQuery.of(context).size.width * 0.0,
                  top: MediaQuery.of(context).size.height * 0.0,
                  bottom: MediaQuery.of(context).size.height * 0.00,
                ),
                padding: const EdgeInsets.all(20.0),
                alignment: Alignment.centerRight,
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: new EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.0,

                        right: MediaQuery.of(context).size.width * 0.1,

                        top: MediaQuery.of(context).size.height * 0.0,

                        // bottom: MediaQuery.of(context).size.height * 0.0,
                      ),
                      child: Text(
                        "Retiradas de pontos                           ",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                        controller: _controller6,
                        keyboardType: TextInputType.numberWithOptions(
                            decimal: false, signed: false),
                        inputFormatters: <TextInputFormatter>[
                          WhitelistingTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        MaterialButton(
                          minWidth: 5.0,
                          child: Icon(Icons.arrow_drop_up),
                          onPressed: () {
                            int currentValue6 = int.parse(_controller6.text);

                            setState(() {
                              currentValue6++;

                              _controller6.text = (currentValue6)
                                  .toString(); // incrementing value
                            });
                          },
                        ),
                        MaterialButton(
                          minWidth: 5.0,
                          child: Icon(Icons.arrow_drop_down),
                          onPressed: () {
                            int currentValue6 = int.parse(_controller6.text);

                            setState(() {
                              print("Setting state");

                              currentValue6--;

                              _controller6.text = (currentValue6)
                                  .toString(); // decrementing value
                            });
                          },
                        ),
                      ],
                    ),
                    Spacer(
                      flex: 01,
                    )
                  ],
                ),
              ),

              // IMPULT NUMEROS 3

              Container(
                padding: const EdgeInsets.all(20.0),
                alignment: Alignment.centerRight,
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: new EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.0,

                        right: MediaQuery.of(context).size.width * 0.1,

                        top: MediaQuery.of(context).size.height * 0.0,

                        // bottom: MediaQuery.of(context).size.height * 0.0,
                      ),
                      child: Text(
                        "Sutura                                                 ",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                        controller: _controller7,
                        keyboardType: TextInputType.numberWithOptions(
                            decimal: false, signed: false),
                        inputFormatters: <TextInputFormatter>[
                          WhitelistingTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        MaterialButton(
                          minWidth: 5.0,
                          child: Icon(Icons.arrow_drop_up),
                          onPressed: () {
                            int currentValue7 = int.parse(_controller7.text);

                            setState(() {
                              currentValue7++;

                              _controller7.text = (currentValue7)
                                  .toString(); // incrementing value
                            });
                          },
                        ),
                        MaterialButton(
                          minWidth: 5.0,
                          child: Icon(Icons.arrow_drop_down),
                          onPressed: () {
                            int currentValue7 = int.parse(_controller7.text);

                            setState(() {
                              print("Setting state");

                              currentValue7--;

                              _controller7.text = (currentValue7)
                                  .toString(); // decrementing value
                            });
                          },
                        ),
                      ],
                    ),
                    Spacer(
                      flex: 01,
                    )
                  ],
                ),
              ),
            ]),
          ],
        ),

        // CHAMAR TELA 2
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Column(children: <Widget>[
              // TITULO

              Container(
                margin: new EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.05,
                  bottom: MediaQuery.of(context).size.height * 0.0,
                ),
                child: Text(
                  "Registro de Atividades",
                  style: TextStyle(fontSize: 20),
                ),
              ),

              // IMPULT NUMEROS

              Container(
                padding: const EdgeInsets.all(20.0),
                alignment: Alignment.center,
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: new EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.0,
                        right: MediaQuery.of(context).size.width * 0.1,
                      ),
                      child: Text(
                        "Atend/grupo/educ.em saude         ",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                        controller: _controller8,
                        keyboardType: TextInputType.numberWithOptions(
                            decimal: false, signed: false),
                        inputFormatters: <TextInputFormatter>[
                          WhitelistingTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        MaterialButton(
                          minWidth: 5.0,
                          child: Icon(Icons.arrow_drop_up),
                          onPressed: () {
                            int currentValue8 = int.parse(_controller8.text);

                            setState(() {
                              currentValue8++;

                              _controller8.text = (currentValue8)
                                  .toString(); // incrementing value
                            });
                          },
                        ),
                        MaterialButton(
                          minWidth: 5.0,
                          child: Icon(Icons.arrow_drop_down),
                          onPressed: () {
                            int currentValue8 = int.parse(_controller8.text);

                            setState(() {
                              print("Setting state");

                              currentValue8--;

                              _controller8.text = (currentValue8)
                                  .toString(); // decrementing value
                            });
                          },
                        ),
                      ],
                    ),
                    Spacer(
                      flex: 01,
                    )
                  ],
                ),
              ),

              // IMPULT NUMEROS 2

              Container(
                margin: new EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.0,
                  right: MediaQuery.of(context).size.width * 0.0,
                  top: MediaQuery.of(context).size.height * 0.0,
                  bottom: MediaQuery.of(context).size.height * 0.00,
                ),
                padding: const EdgeInsets.all(20.0),
                alignment: Alignment.centerRight,
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: new EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.0,

                        right: MediaQuery.of(context).size.width * 0.1,

                        top: MediaQuery.of(context).size.height * 0.0,

                        // bottom: MediaQuery.of(context).size.height * 0.0,
                      ),
                      child: Text(
                        "Procedimentos coletivos (PCI)         ",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                        controller: _controller9,
                        keyboardType: TextInputType.numberWithOptions(
                            decimal: false, signed: false),
                        inputFormatters: <TextInputFormatter>[
                          WhitelistingTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        MaterialButton(
                          minWidth: 5.0,
                          child: Icon(Icons.arrow_drop_up),
                          onPressed: () {
                            int currentValue9 = int.parse(_controller9.text);

                            setState(() {
                              currentValue9++;

                              _controller9.text = (currentValue9)
                                  .toString(); // incrementing value
                            });
                          },
                        ),
                        MaterialButton(
                          minWidth: 5.0,
                          child: Icon(Icons.arrow_drop_down),
                          onPressed: () {
                            int currentValue9 = int.parse(_controller9.text);

                            setState(() {
                              print("Setting state");

                              currentValue9--;

                              _controller9.text = (currentValue9)
                                  .toString(); // decrementing value
                            });
                          },
                        ),
                      ],
                    ),
                    Spacer(
                      flex: 01,
                    )
                  ],
                ),
              ),

              // IMPULT NUMEROS 3

              Container(
                margin: new EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.0,
                  right: MediaQuery.of(context).size.width * 0.0,
                  top: MediaQuery.of(context).size.height * 0.0,
                  bottom: MediaQuery.of(context).size.height * 0.00,
                ),
                padding: const EdgeInsets.all(20.0),
                alignment: Alignment.centerRight,
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: new EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.0,

                        right: MediaQuery.of(context).size.width * 0.1,

                        top: MediaQuery.of(context).size.height * 0.0,

                        // bottom: MediaQuery.of(context).size.height * 0.0,
                      ),
                      child: Text(
                        "Reuniões                                            ",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                        controller: _controller10,
                        keyboardType: TextInputType.numberWithOptions(
                            decimal: false, signed: false),
                        inputFormatters: <TextInputFormatter>[
                          WhitelistingTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        MaterialButton(
                          minWidth: 5.0,
                          child: Icon(Icons.arrow_drop_up),
                          onPressed: () {
                            int currentValue10 = int.parse(_controller10.text);

                            setState(() {
                              currentValue10++;

                              _controller10.text = (currentValue10)
                                  .toString(); // incrementing value
                            });
                          },
                        ),
                        MaterialButton(
                          minWidth: 5.0,
                          child: Icon(Icons.arrow_drop_down),
                          onPressed: () {
                            int currentValue10 = int.parse(_controller10.text);

                            setState(() {
                              print("Setting state");

                              currentValue10--;

                              _controller10.text = (currentValue10)
                                  .toString(); // decrementing value
                            });
                          },
                        ),
                      ],
                    ),
                    Spacer(
                      flex: 01,
                    )
                  ],
                ),
              ),

              // IMPULT NUMEROS 3

              Container(
                padding: const EdgeInsets.all(20.0),
                alignment: Alignment.centerRight,
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: new EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.0,

                        right: MediaQuery.of(context).size.width * 0.1,

                        top: MediaQuery.of(context).size.height * 0.0,

                        // bottom: MediaQuery.of(context).size.height * 0.0,
                      ),
                      child: Text(
                        "Visita domiciliar                               ",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                        controller: _controller11,
                        keyboardType: TextInputType.numberWithOptions(
                            decimal: false, signed: false),
                        inputFormatters: <TextInputFormatter>[
                          WhitelistingTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        MaterialButton(
                          minWidth: 5.0,
                          child: Icon(Icons.arrow_drop_up),
                          onPressed: () {
                            int currentValue11 = int.parse(_controller11.text);

                            setState(() {
                              currentValue11++;

                              _controller11.text = (currentValue11)
                                  .toString(); // incrementing value
                            });
                          },
                        ),
                        MaterialButton(
                          minWidth: 5.0,
                          child: Icon(Icons.arrow_drop_down),
                          onPressed: () {
                            int currentValue11 = int.parse(_controller11.text);

                            setState(() {
                              print("Setting state");

                              currentValue11--;

                              _controller11.text = (currentValue11)
                                  .toString(); // decrementing value
                            });
                          },
                        ),
                      ],
                    ),
                    Spacer(
                      flex: 01,
                    )
                  ],
                ),
              ),
            ]),
          ],
        ),
        // CHAMAR TELA 2
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Column(children: <Widget>[
              // TITULO

              Container(
                margin: new EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.05,
                  bottom: MediaQuery.of(context).size.height * 0.0,
                ),
                child: Text(
                  "Registro de Atividades",
                  style: TextStyle(fontSize: 20),
                ),
              ),

              // IMPULT NUMEROS

              Container(
                padding: const EdgeInsets.all(20.0),
                alignment: Alignment.center,
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: new EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.0,
                        right: MediaQuery.of(context).size.width * 0.1,
                      ),
                      child: Text(
                        "Terapia de reidratação Oral               ",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                        controller: _controller12,
                        keyboardType: TextInputType.numberWithOptions(
                            decimal: false, signed: false),
                        inputFormatters: <TextInputFormatter>[
                          WhitelistingTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        MaterialButton(
                          minWidth: 5.0,
                          child: Icon(Icons.arrow_drop_up),
                          onPressed: () {
                            int currentValue12 = int.parse(_controller12.text);

                            setState(() {
                              currentValue12++;

                              _controller12.text = (currentValue12)
                                  .toString(); // incrementing value
                            });
                          },
                        ),
                        MaterialButton(
                          minWidth: 5.0,
                          child: Icon(Icons.arrow_drop_down),
                          onPressed: () {
                            int currentValue12 = int.parse(_controller12.text);

                            setState(() {
                              print("Setting state");

                              currentValue12--;

                              _controller12.text = (currentValue12)
                                  .toString(); // decrementing value
                            });
                          },
                        ),
                      ],
                    ),
                    Spacer(
                      flex: 01,
                    )
                  ],
                ),
              ),

              // IMPULT NUMEROS 2

              Container(
                margin: new EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.0,
                  right: MediaQuery.of(context).size.width * 0.0,
                  top: MediaQuery.of(context).size.height * 0.0,
                  bottom: MediaQuery.of(context).size.height * 0.00,
                ),
                padding: const EdgeInsets.all(20.0),
                alignment: Alignment.centerRight,
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: new EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.0,

                        right: MediaQuery.of(context).size.width * 0.1,

                        top: MediaQuery.of(context).size.height * 0.0,

                        // bottom: MediaQuery.of(context).size.height * 0.0,
                      ),
                      child: Text(
                        "Menores de 2 anos com diarréia       ",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                        controller: _controller13,
                        keyboardType: TextInputType.numberWithOptions(
                            decimal: false, signed: false),
                        inputFormatters: <TextInputFormatter>[
                          WhitelistingTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        MaterialButton(
                          minWidth: 5.0,
                          child: Icon(Icons.arrow_drop_up),
                          onPressed: () {
                            int currentValue13 = int.parse(_controller13.text);

                            setState(() {
                              currentValue13++;

                              _controller13.text = (currentValue13)
                                  .toString(); // incrementing value
                            });
                          },
                        ),
                        MaterialButton(
                          minWidth: 5.0,
                          child: Icon(Icons.arrow_drop_down),
                          onPressed: () {
                            int currentValue13 = int.parse(_controller13.text);

                            setState(() {
                              print("Setting state");

                              currentValue13--;

                              _controller13.text = (currentValue13)
                                  .toString(); // decrementing value
                            });
                          },
                        ),
                      ],
                    ),
                    Spacer(
                      flex: 01,
                    )
                  ],
                ),
              ),

              // IMPULT NUMEROS 2

              Container(
                margin: new EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.0,
                  right: MediaQuery.of(context).size.width * 0.0,
                  top: MediaQuery.of(context).size.height * 0.0,
                  bottom: MediaQuery.of(context).size.height * 0.00,
                ),
                padding: const EdgeInsets.all(20.0),
                alignment: Alignment.centerRight,
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: new EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.0,

                        right: MediaQuery.of(context).size.width * 0.1,

                        top: MediaQuery.of(context).size.height * 0.0,

                        // bottom: MediaQuery.of(context).size.height * 0.0,
                      ),
                      child: Text(
                        "<2 anos com diarreia e usaram TRO",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                        controller: _controller14,
                        keyboardType: TextInputType.numberWithOptions(
                            decimal: false, signed: false),
                        inputFormatters: <TextInputFormatter>[
                          WhitelistingTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        MaterialButton(
                          minWidth: 5.0,
                          child: Icon(Icons.arrow_drop_up),
                          onPressed: () {
                            int currentValue14 = int.parse(_controller14.text);

                            setState(() {
                              currentValue14++;

                              _controller14.text = (currentValue14)
                                  .toString(); // incrementing value
                            });
                          },
                        ),
                        MaterialButton(
                          minWidth: 5.0,
                          child: Icon(Icons.arrow_drop_down),
                          onPressed: () {
                            int currentValue14 = int.parse(_controller14.text);

                            setState(() {
                              print("Setting state");

                              currentValue14--;

                              _controller14.text = (currentValue14)
                                  .toString(); // decrementing value
                            });
                          },
                        ),
                      ],
                    ),
                    Spacer(
                      flex: 01,
                    )
                  ],
                ),
              ),

              // IMPULT NUMEROS 2

              Container(
                margin: new EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.0,
                  right: MediaQuery.of(context).size.width * 0.0,
                  top: MediaQuery.of(context).size.height * 0.0,
                  bottom: MediaQuery.of(context).size.height * 0.00,
                ),
                padding: const EdgeInsets.all(20.0),
                alignment: Alignment.centerRight,
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: new EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.0,

                        right: MediaQuery.of(context).size.width * 0.1,

                        top: MediaQuery.of(context).size.height * 0.0,

                        // bottom: MediaQuery.of(context).size.height * 0.0,
                      ),
                      child: Text(
                        "<2 anos infecção respiratória aguda",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                        controller: _controller15,
                        keyboardType: TextInputType.numberWithOptions(
                            decimal: false, signed: false),
                        inputFormatters: <TextInputFormatter>[
                          WhitelistingTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        MaterialButton(
                          minWidth: 5.0,
                          child: Icon(Icons.arrow_drop_up),
                          onPressed: () {
                            int currentValue15 = int.parse(_controller15.text);

                            setState(() {
                              currentValue15++;

                              _controller15.text = (currentValue15)
                                  .toString(); // incrementing value
                            });
                          },
                        ),
                        MaterialButton(
                          minWidth: 5.0,
                          child: Icon(Icons.arrow_drop_down),
                          onPressed: () {
                            int currentValue15 = int.parse(_controller15.text);

                            setState(() {
                              print("Setting state");

                              currentValue15--;

                              _controller15.text = (currentValue15)
                                  .toString(); // decrementing value
                            });
                          },
                        ),
                      ],
                    ),
                    Spacer(
                      flex: 01,
                    )
                  ],
                ),
              ),
            ]),
          ],
        ),

        Container(
          margin: new EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.0,
            right: MediaQuery.of(context).size.width * 0.0,
            top: MediaQuery.of(context).size.height * 0.0,
            bottom: MediaQuery.of(context).size.height * 0.0,
          ),
          padding: EdgeInsets.all(0.0),
          child:
              new Column(mainAxisAlignment: MainAxisAlignment.start, children: <
                  Widget>[
            // ULTIMA TELA
            Container(
              margin: new EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.05,
                bottom: MediaQuery.of(context).size.height * 0.0,
              ),
              child: Text(
                "Médico",
                style: TextStyle(fontSize: 20),
              ),
            ),

            Container(
              margin: new EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.0,
                right: MediaQuery.of(context).size.width * 0.0,
                top: MediaQuery.of(context).size.height * 0.0,
                bottom: MediaQuery.of(context).size.height * 0.00,
              ),
              padding: const EdgeInsets.all(20.0),
              alignment: Alignment.centerRight,
              child: Row(
                children: <Widget>[
                  Container(
                    margin: new EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.0,

                      right: MediaQuery.of(context).size.width * 0.1,

                      top: MediaQuery.of(context).size.height * 0.0,

                      // bottom: MediaQuery.of(context).size.height * 0.0,
                    ),
                    child: Text(
                      "<5 anos que tiveram pneamunia      ",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      controller: _controller16,
                      keyboardType: TextInputType.numberWithOptions(
                          decimal: false, signed: false),
                      inputFormatters: <TextInputFormatter>[
                        WhitelistingTextInputFormatter.digitsOnly
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      MaterialButton(
                        minWidth: 5.0,
                        child: Icon(Icons.arrow_drop_up),
                        onPressed: () {
                          int currentValue16 = int.parse(_controller16.text);

                          setState(() {
                            currentValue16++;

                            _controller16.text =
                                (currentValue16).toString(); // incrementing value
                          });
                        },
                      ),
                      MaterialButton(
                        minWidth: 5.0,
                        child: Icon(Icons.arrow_drop_down),
                        onPressed: () {
                          int currentValue16 = int.parse(_controller16.text);

                          setState(() {
                            print("Setting state");

                            currentValue16--;

                            _controller16.text =
                                (currentValue16).toString(); // decrementing value
                          });
                        },
                      ),
                    ],
                  ),
                  Spacer(
                    flex: 01,
                  )
                ],
              ),
            ),

            // IMPULT NUMEROS 2

            Container(
              margin: new EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.0,
                right: MediaQuery.of(context).size.width * 0.0,
                top: MediaQuery.of(context).size.height * 0.0,
                bottom: MediaQuery.of(context).size.height * 0.00,
              ),
              padding: const EdgeInsets.all(20.0),
              alignment: Alignment.bottomRight,
              child: Row(
                children: <Widget>[
                  Container(
                    margin: new EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.0,

                      right: MediaQuery.of(context).size.width * 0.1,

                      top: MediaQuery.of(context).size.height * 0.0,

                      // bottom: MediaQuery.of(context).size.height * 0.0,
                    ),
                    child: Text(
                      "Acidente cvascular cerebral            ",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      controller: _controller17,
                      keyboardType: TextInputType.numberWithOptions(
                          decimal: false, signed: false),
                      inputFormatters: <TextInputFormatter>[
                        WhitelistingTextInputFormatter.digitsOnly
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      MaterialButton(
                        minWidth: 5.0,
                        child: Icon(Icons.arrow_drop_up),
                        onPressed: () {
                          int currentValue17 = int.parse(_controller17.text);

                          setState(() {
                            currentValue17++;

                            _controller17.text =
                                (currentValue17).toString(); // incrementing value
                          });
                        },
                      ),
                      MaterialButton(
                        minWidth: 5.0,
                        child: Icon(Icons.arrow_drop_down),
                        onPressed: () {
                          int currentValue17 = int.parse(_controller17.text);

                          setState(() {
                            print("Setting state");

                            currentValue17--;

                            _controller17.text =
                                (currentValue17).toString(); // decrementing value
                          });
                        },
                      ),
                    ],
                  ),
                  Spacer(
                    flex: 01,
                  )
                ],
              ),
            ),

            // IMPULT NUMEROS 2

            Container(
              margin: new EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.0,
                right: MediaQuery.of(context).size.width * 0.0,
                top: MediaQuery.of(context).size.height * 0.0,
                bottom: MediaQuery.of(context).size.height * 0.0,
              ),
              padding: const EdgeInsets.all(20.0),
              alignment: Alignment.topCenter,
              child: Row(
                children: <Widget>[
                  Container(
                    margin: new EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.0,

                      right: MediaQuery.of(context).size.width * 0.1,

                      top: MediaQuery.of(context).size.height * 0.0,

                      // bottom: MediaQuery.of(context).size.height * 0.0,
                    ),
                    child: Text(
                      " Infarto agudo da miocárdia          ",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      controller: _controller18,
                      keyboardType: TextInputType.numberWithOptions(
                          decimal: false, signed: false),
                      inputFormatters: <TextInputFormatter>[
                        WhitelistingTextInputFormatter.digitsOnly
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      MaterialButton(
                        minWidth: 5.0,
                        child: Icon(Icons.arrow_drop_up),
                        onPressed: () {
                          int currentValue18 = int.parse(_controller18.text);

                          setState(() {
                            currentValue18++;

                            _controller18.text =
                                (currentValue18).toString(); // incrementing value
                          });
                        },
                      ),
                      MaterialButton(
                        minWidth: 5.0,
                        child: Icon(Icons.arrow_drop_down),
                        onPressed: () {
                          int currentValue18 = int.parse(_controller17.text);

                          setState(() {
                            print("Setting state");

                            currentValue18--;

                            _controller18.text =
                                (currentValue18).toString(); // decrementing value
                          });
                        },
                      ),
                    ],
                  ),
                  Spacer(
                    flex: 01,
                  )
                ],
              ),
            ),

            // IMPULT NUMEROS 2

            Container(
              margin: new EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.0,
                right: MediaQuery.of(context).size.width * 0.0,
                top: MediaQuery.of(context).size.height * 0.0,
                bottom: MediaQuery.of(context).size.height * 0.1,
              ),
              padding: const EdgeInsets.all(20.0),
              alignment: Alignment.centerRight,
              child: Row(
                children: <Widget>[
                  Container(
                    margin: new EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.0,

                      right: MediaQuery.of(context).size.width * 0.1,

                      top: MediaQuery.of(context).size.height * 0.0,

                      // bottom: MediaQuery.of(context).size.height * 0.0,
                    ),
                    child: Text(
                      "DHEG (forma grave)                       ",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      controller: _controller19,
                      keyboardType: TextInputType.numberWithOptions(
                          decimal: false, signed: false),
                      inputFormatters: <TextInputFormatter>[
                        WhitelistingTextInputFormatter.digitsOnly
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      MaterialButton(
                        minWidth: 5.0,
                        child: Icon(Icons.arrow_drop_up),
                        onPressed: () {
                          int currentValue19 = int.parse(_controller19.text);

                          setState(() {
                            currentValue19++;

                            _controller19.text =
                                (currentValue19).toString(); // incrementing value
                          });
                        },
                      ),
                      MaterialButton(
                        minWidth: 5.0,
                        child: Icon(Icons.arrow_drop_down),
                        onPressed: () {
                          int currentValue19 = int.parse(_controller19.text);

                          setState(() {
                            print("Setting state");

                            currentValue19--;

                            _controller19.text =
                                (currentValue19 ).toString(); // decrementing value
                          });
                        },
                      ),
                    ],
                  ),
                  Spacer(
                    flex: 01,
                  )
                ],
              ),
            ),
          ]),
        ),

        FlatButton(
            color: Colors.blueAccent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100)),
            child: Text(
              'Salvar',
              style: TextStyle(
                fontWeight: FontWeight.w300,
                color: Colors.white,
                fontSize: 30,
              ),
              textAlign: TextAlign.left,
            ),
            onPressed: () {
              Navigator.of(context).pop();

              Map<String, dynamic> FichaD = {

                'Segmento': this.Segmentof,
                'Cns do profissional': this.CNSdoProfissional,
                'unidade': this.Unidadef,
                'Nome do Profissional':this.Profissionalf,
                'Area': this.Areaf,
                'Micro Area': this.Microareaf,
                'Municiopio': this._municiopiof,
                'Atendimento Especifico para AT':this._controller.text,
                'Visita de inspeção sanitária':this._controller1.text,
                'Atend/individual/prof.nivel/superior':this._controller2.text,
                'Curativos':this._controller3.text,
                'Inalação':this._controller4.text,
                'Injeções':this._controller5.text,
                'Retiradas de pontos':this._controller6.text,
                'Sutura':this._controller7.text,
                'Atend/grupo/educ.em saude':this._controller8.text,
                'Procedimentos coleticos (PCI)':this._controller9.text,
                'reuniões':this._controller10.text,
                'Visita domociliar':this._controller11.text,
                'Terapia de reidratação oral':this._controller12.text,
                'Menores de 2 anos com diarreia':this._controller13.text,
                '<2 anos com diarreia e usaram TRO':this._controller14.text,
                '<2 anos com infecção resperatória aguda':this._controller15.text,
                '<5 anos que tiveram pneamunia': this._controller16.text,
                'Acidente Cardiovascular':this._controller17.text,
                'Infarto Agudo da miocardia':this._controller18.text,
                'DHEG (forma grave)':this._controller19.text,
              };
              crudObj.addFicha(FichaD).then((result) {
                dialogTrigger(context);
              }).catchError((e) {
                print(e);
              });
            }),
      ],
      scrollDirection: Axis.horizontal,
      physics: ClampingScrollPhysics(),
    );
  }
}
