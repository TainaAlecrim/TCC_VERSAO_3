import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_demo/pages/crud.dart';
import 'package:flutter_login_demo/pages/home_page.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'dart:async';
import 'package:date_field/date_field.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';

class Cadastro extends StatefulWidget {
  @override
  _StepperState createState() => _StepperState();
}

final _formkey = GlobalKey<FormState>();
final List<String> ufs = [
  'AL',
  'AP',
  'AM',
  'BA',
  'CE',
  'DF',
  'ES',
  'GO',
  'MA',
  'MT',
  'MS',
  'MG',
  'PA',
  'PB',
  'PR',
  'PE',
  'PI',
  'RJ',
  'RN',
  'RS',
  'RO',
  'RR',
  'SC',
  'SP',
  'SE',
];

class _StepperState extends State<Cadastro> {
  FocusNode _focusNode = new FocusNode();
  int _currentStep = 0;
  int group = 1;
  int sexualidade = 2;
  int lixo = 3;
  int tratamento = 4;
  int abastecimento = 5;
  int esgoto = 6;
  int plano = 7;
  int doenca = 8;
  int comunitario = 9;
  int transporte = 10;
  String numeroresidencia;
  get checkBoxValue => null;
  String Nome;
  String CNSn;
  String mae;
  String endereco;
  int nacionalidade;
  String nacionalidade1;
  String sexo1;
  String moradia1;
  String energia1;
  String trata_agua1;
  String destino1;
  String agua;
  String esgoto1;
  String plano1;
  String doenca1;
  String comunitario1;
  String transporte1;
  String _ufresidencial;
  String _raca;
  String bairro;
  String cep;
  String comodos;
  String nomeplanodesaude;
  String numerodepessoasplano;

  crudMedthods crudObj = new crudMedthods();

  Future<Null> _focusNodeListener() async {
    if (_focusNode.hasFocus) {
      print('TextField got the focus');
    } else {
      print('TextField lost the focus');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      body: new Container(
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Stack(children: <Widget>[_showForm()]),
        ),
      ),
    );
  }

  Widget CNS() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Cns do cidadão',
            icon: new Icon(
              Icons.card_membership,
              color: Colors.grey,
            )),
        validator: (value) =>
            value.isEmpty ? 'O campo CNS não pode ficar vazio' : null,
        onChanged: (value) {
          this.CNSn = value;
        },
      ),
    );
  }

  Widget NomeCadastro() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      child: new TextFormField(
        textInputAction: TextInputAction.next,
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Nome',
            icon: new Icon(
              Icons.people,
              color: Colors.grey,
            )),
        validator: (value) =>
            value.isEmpty ? 'O campo Nome não pode ficar vazio' : null,
        onChanged: (value) {
          this.Nome = value;
        },
      ),
    );
  }

  DateTime _selectedDate;
  Widget DataNascimento() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(40.0, 0.0, 0.0, 0.0),
        child: DatePickerWidget(

      looping: false, // default is not looping
      firstDate: DateTime(1900, 01, 01),
      lastDate: DateTime(2100, 1, 1),
      initialDate: DateTime(1900, 01, 01),
      pickerTheme: DateTimePickerTheme(
        itemTextStyle: TextStyle(color: Colors.black, fontSize: 14),
        dividerColor: Colors.black,
      ),
    )
        );
  }

  Widget NomeMae() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.text,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Nome Completo da Mae',
            icon: new Icon(
              Icons.people,
              color: Colors.grey,
            )),
        validator: (value) =>
            value.isEmpty ? 'O campo NomeMae não pode ficar vazio' : null,
        onChanged: (value) {
          this.mae = value;
        },
      ),
    );
  }

  Widget Nacionalidade() {
    return Container(
      margin: new EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.02,
      ),
      padding: EdgeInsets.all(0.0),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Text(
            'Nacionalidade:',
            style: new TextStyle(
              fontSize: 16.0,
            ),
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Radio(
                value: 0,
                groupValue: nacionalidade,
                onChanged: (value) {
                  print(value);
                  setState(() {
                    nacionalidade = value;
                    this.nacionalidade1 = 'Brasileiro';
                  });
                },
              ),
              new Text('Brasileiro',
                  style: new TextStyle(
                    fontSize: 12.5,
                  )),
              new Radio(
                value: 1,
                groupValue: nacionalidade,
                onChanged: (value) {
                  print(value);
                  setState(() {
                    nacionalidade = value;
                    this.nacionalidade1 = 'Estrageiro';
                  });
                },
              ),
              new Text('Estrageiro',
                  style: new TextStyle(
                    fontSize: 12.5,
                  )),
              new Radio(
                value: 2,
                groupValue: nacionalidade,
                onChanged: (value) {
                  print(value);
                  setState(() {
                    nacionalidade = value;
                    this.nacionalidade1 = 'Naturalizado';
                  });
                },
              ),
              new Text('Naturalizado',
                  style: new TextStyle(
                    fontSize: 12.5,
                  )),
            ],
          ),
        ],
      ),
    );
  }

  int sexo = 0;
  Widget Sexo() {
    return Container(
      padding: EdgeInsets.all(0.0),
      margin: new EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.00,
        right: MediaQuery.of(context).size.width * 0.0,
        top: MediaQuery.of(context).size.height * 0.01,
        bottom: MediaQuery.of(context).size.height * 0.0,
      ),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(
            'Sexo:',
            style: new TextStyle(fontSize: 16),
          ),
          Row(
            children: <Widget>[
              Radio(
                  value: 1,
                  groupValue: sexo,
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      sexo = value;
                      this.sexo1 = 'Feminino';
                    });
                  }),
              Text(
                "Feminino",
                style: new TextStyle(fontSize: 14),
              ),
              Radio(
                  value: 2,
                  groupValue: sexo,
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      sexo = value;
                      this.sexo1 = 'Masculino';
                    });
                  }),
              Text(
                "Masculino",
                style: new TextStyle(fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _dropDownValue;

  @override
  Widget Raca() {
    return DropdownButton<String>(
      hint: _dropDownValue == null
          ? Text('Selecione')
          : Text(
              _dropDownValue,
              style: TextStyle(color: Colors.blueAccent),
            ),
      value: _raca,
      icon: Icon(Icons.keyboard_arrow_down),
      iconSize: 19,
      elevation: 20,
      style: TextStyle(color: Colors.blueAccent),
      underline: Container(
        height: 2,
        color: Colors.grey,
      ),
      items: <String>['Preto', 'Branco', 'Indigena', 'Amarelo']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (val) => setState(() => _raca = val),
    );
  }

  Widget Endereco() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.text,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Endereço',
            icon: new Icon(
              Icons.location_on,
              color: Colors.grey,
            )),
        validator: (value) =>
            value.isEmpty ? 'O campo Endereço não pode ficar vazio' : null,
        onChanged: (value) {
          this.endereco = value;
        },
      ),
    );
  }

  Widget NumeroResidencial() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.number,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Nº',
            icon: new Icon(
              Icons.home,
              color: Colors.grey,
            )),
        validator: (value) => value.isEmpty
            ? 'O campo Numero Residencial não pode ficar vazio'
            : null,
        onChanged: (value) {
          this.numeroresidencia = value;
        },
      ),
    );
  }

  Widget Bairro() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.text,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Bairro',
            icon: new Icon(
              Icons.location_city,
              color: Colors.grey,
            )),
        validator: (value) =>
            value.isEmpty ? 'O campo Bairro não pode ficar vazio' : null,
        onChanged: (value) {
          this.bairro = value;
        },
      ),
    );
  }

  Widget Cep() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.number,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Cep',
            icon: new Icon(
              Icons.local_post_office,
              color: Colors.grey,
            )),
        validator: (value) => value.isEmpty
            ? 'O campo Numero Residencial não pode ficar vazio'
            : null,
        onChanged: (value) {
          this.cep = value;
        },
      ),
    );
  }

  String dropdownValueU;
  @override
  Widget Uf() {
    return Form(
      key: _formkey,
      child: Column(
        children: <Widget>[
          SizedBox(height: 15),
          //drop
          DropdownButton(
            hint: dropdownValueU == null
                ? Text('Selecione   ')
                : Text(
                    _dropDownValue,
                    style: TextStyle(color: Colors.deepPurple),
                  ),
            icon: Icon(Icons.keyboard_arrow_down),
            value: _ufresidencial,
            iconSize: 19,
            elevation: 20,
            style: TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 2,
              color: Colors.grey,
            ),
            items: ufs.map((ufs) {
              return DropdownMenuItem(
                value: ufs,
                child: Text('$ufs'),
              );
            }).toList(),
            onChanged: (val) => setState(() => _ufresidencial = val),
          ),
        ],
      ),
    );
  }

  int moradia = 0;
  Widget Moradia() {
    return Container(
      padding: EdgeInsets.all(0.0),
      margin: new EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.00,
        right: MediaQuery.of(context).size.width * 0.0,
        top: MediaQuery.of(context).size.height * 0.0,
        bottom: MediaQuery.of(context).size.height * 0.0,
      ),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Situação de moradia e saneamento',
            style: new TextStyle(fontSize: 18),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Radio(
                  value: 1,
                  groupValue: moradia,
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      moradia = value;
                      this.moradia1 = 'Tijolo';
                    });
                  }),
              Text(
                "Tijolo",
                style: new TextStyle(fontSize: 12),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Radio(
                  value: 2,
                  groupValue: moradia,
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      moradia = value;
                      this.moradia1 = 'Taipa Revestida';
                    });
                  }),
              Text(
                "Taipa Revestida",
                style: new TextStyle(fontSize: 12),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Radio(
                  value: 3,
                  groupValue: moradia,
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      moradia = value;
                      this.moradia1 = 'Taipa não Revestida';
                    });
                  }),
              Text(
                "Taipa não Revestida",
                style: new TextStyle(fontSize: 12),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Radio(
                  value: 4,
                  groupValue: moradia,
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      moradia = value;
                      this.moradia1 = 'Madeira';
                    });
                  }),
              Text(
                "Madeira",
                style: new TextStyle(fontSize: 12),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Radio(
                  value: 5,
                  groupValue: moradia,
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      moradia = value;
                      this.moradia1 = 'Madeira Aproveitada';
                    });
                  }),
              Text(
                "Madeira Aproveitada",
                style: new TextStyle(fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget Comodos() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 90, 0),
      child: new TextFormField(
        maxLines: 1,
        autofocus: false,
        keyboardType: TextInputType.number,
        decoration: new InputDecoration(
            hintText: 'Quantidade de comodos',
            icon: new Icon(
              Icons.format_list_numbered_rtl,
              color: Colors.grey,
            )),
        validator: (value) => value.isEmpty
            ? 'O campo Numero Residencial não pode ficar vazio'
            : null,
        onChanged: (value) {
          this.comodos = value;
        },
      ),
    );
  }

  int destino = 0;
  Widget DestinodoLixo() {
    return Container(
      padding: EdgeInsets.all(0.0),
      margin: new EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0,
        right: MediaQuery.of(context).size.width * 0.0,
        top: MediaQuery.of(context).size.height * 0.02,
        bottom: MediaQuery.of(context).size.height * 0.0,
      ),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Destino do lixo:',
            style: new TextStyle(fontSize: 16),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Radio(
                  value: 1,
                  groupValue: destino,
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      destino = value;
                      this.destino1 = 'Coletado';
                    });
                  }),
              Text(
                "Coletado",
                style: new TextStyle(fontSize: 14),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Radio(
                  value: 2,
                  groupValue: destino,
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      destino = value;
                      this.destino1 = 'Queimado/Enterrado';
                    });
                  }),
              Text(
                "Queimado/Enterrado",
                style: new TextStyle(fontSize: 14),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Radio(
                  value: 3,
                  groupValue: destino,
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      destino = value;
                      this.destino1 = 'Céu aberto';
                    });
                  }),
              Text(
                "Céu aberto",
                style: new TextStyle(fontSize: 14),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Radio(
                  value: 4,
                  groupValue: destino,
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      destino = value;
                      this.destino1 = 'Material aproveitado';
                    });
                  }),
              Text(
                "Material aproveitado",
                style: new TextStyle(fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }

  int trata_agua = 0;
  Widget TratamendodeAgua() {
    return Container(
      padding: EdgeInsets.all(0.0),
      margin: new EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0,
        right: MediaQuery.of(context).size.width * 0.0,
        top: MediaQuery.of(context).size.height * 0.02,
        bottom: MediaQuery.of(context).size.height * 0.0,
      ),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Tratamento de Agua no domicílio:',
            style: new TextStyle(fontSize: 16),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Radio(
                  value: 1,
                  groupValue: trata_agua,
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      trata_agua = value;
                      this.trata_agua1 = 'Filtrada';
                    });
                  }),
              Text(
                "Filtrada",
                style: new TextStyle(fontSize: 14),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Radio(
                  value: 2,
                  groupValue: trata_agua,
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      trata_agua = value;
                      this.trata_agua1 = 'Fervura';
                    });
                  }),
              Text(
                "Fervura",
                style: new TextStyle(fontSize: 14),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Radio(
                  value: 3,
                  groupValue: trata_agua,
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      trata_agua = value;
                      this.trata_agua1 = 'Cloração';
                    });
                  }),
              Text(
                "Cloração",
                style: new TextStyle(fontSize: 14),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Radio(
                  value: 4,
                  groupValue: trata_agua,
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      trata_agua = value;
                      this.trata_agua1 = 'Sem tratamento';
                    });
                  }),
              Text(
                "Sem tratamento",
                style: new TextStyle(fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget Abastecimento() {
    return Container(
      padding: EdgeInsets.all(0.0),
      margin: new EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0,
        right: MediaQuery.of(context).size.width * 0.0,
        top: MediaQuery.of(context).size.height * 0.02,
        bottom: MediaQuery.of(context).size.height * 0.0,
      ),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Abastecimento de Agua:',
            style: new TextStyle(fontSize: 16),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Radio(
                  value: 1,
                  groupValue: abastecimento,
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      abastecimento = value;
                      this.agua = 'Rede geral';
                    });
                  }),
              Text(
                "Rede geral",
                style: new TextStyle(fontSize: 14),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Radio(
                  value: 2,
                  groupValue: abastecimento,
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      abastecimento = value;
                      this.agua = 'Poço ou nascente';
                    });
                  }),
              Text(
                "Poço ou nascente",
                style: new TextStyle(fontSize: 14),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Radio(
                  value: 3,
                  groupValue: abastecimento,
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      abastecimento = value;
                      this.agua = 'Outros';
                    });
                  }),
              Text(
                "Outros",
                style: new TextStyle(fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget DestinodeFezeseUrina() {
    return Container(
      padding: EdgeInsets.all(0.0),
      margin: new EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0,
        right: MediaQuery.of(context).size.width * 0.0,
        top: MediaQuery.of(context).size.height * 0.02,
        bottom: MediaQuery.of(context).size.height * 0.0,
      ),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Destino do lixo:',
            style: new TextStyle(fontSize: 16),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Radio(
                  value: 0,
                  groupValue: esgoto,
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      esgoto = value;
                      this.esgoto1 = 'Sistema de esgoto (rede geral)';
                    });
                  }),
              Text(
                "Sistema de esgoto (rede geral)",
                style: new TextStyle(fontSize: 14),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Radio(
                  value: 1,
                  groupValue: esgoto,
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      esgoto = value;
                      this.esgoto1 = 'Fossa';
                    });
                  }),
              Text(
                "Fossa",
                style: new TextStyle(fontSize: 14),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Radio(
                  value: 2,
                  groupValue: esgoto,
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      esgoto = value;
                      this.esgoto1 = 'Céu aberto';
                    });
                  }),
              Text(
                "Céu aberto",
                style: new TextStyle(fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }

  int energia = 0;
  Widget EnergiaEletrica() {
    return Container(
      padding: EdgeInsets.all(0.0),
      margin: new EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.00,
        right: MediaQuery.of(context).size.width * 0.0,
        top: MediaQuery.of(context).size.height * 0.01,
        bottom: MediaQuery.of(context).size.height * 0.0,
      ),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(
            'Possui energia eletrica:',
            style: new TextStyle(fontSize: 16),
          ),
          Row(
            children: <Widget>[
              Radio(
                  value: 1,
                  groupValue: energia,
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      energia = value;
                      this.energia1 = 'Sim';
                    });
                  }),
              Text(
                "Sim",
                style: new TextStyle(fontSize: 14),
              ),
              Radio(
                  value: 2,
                  groupValue: energia,
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      energia = value;
                      this.energia1 = 'Não';
                    });
                  }),
              Text(
                "Não",
                style: new TextStyle(fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // OUTRAS INFORMAÇÕES

  Widget PlanodeSaude() {
    return Container(
      padding: EdgeInsets.all(0.0),
      margin: new EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0,
        right: MediaQuery.of(context).size.width * 0.0,
        top: MediaQuery.of(context).size.height * 0.040,
        bottom: MediaQuery.of(context).size.height * 0.0,
      ),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(
            'Alguém da familia possui plano de saúde:',
            style: new TextStyle(fontSize: 16),
          ),
          Row(
            children: <Widget>[
              Radio(
                  value: 0,
                  groupValue: plano,
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      plano = value;
                      this.plano1 = 'Sim';
                    });
                  }),
              Text(
                "Sim",
                style: new TextStyle(fontSize: 14),
              ),
              Radio(
                  value: 1,
                  groupValue: plano,
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      plano = value;
                      this.plano1 = 'Não';
                    });
                  }),
              Text(
                "Não",
                style: new TextStyle(fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget NomePlanoSaude() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 40, 0.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.text,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Nome do plano de saúde',
            icon: new Icon(
              Icons.people,
              color: Colors.grey,
            )),
        validator: (value) => value.isEmpty
            ? 'O campo Numero Residencial não pode ficar vazio'
            : null,
        onChanged: (value) {
          this.nomeplanodesaude = value;
        },
      ),
    );
  }

  Widget NumerodePessoasPlano() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 150, 0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.number,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Quantas utilizam ?',
            icon: new Icon(
              Icons.format_list_numbered_rtl,
              color: Colors.grey,
            )),
        validator: (value) => value.isEmpty
            ? 'O campo Numero Residencial não pode ficar vazio'
            : null,
        onChanged: (value) {
          this.numerodepessoasplano = value;
        },
      ),
    );
  }

  Widget Doenca() {
    return Container(
      padding: EdgeInsets.all(0.0),
      margin: new EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0,
        right: MediaQuery.of(context).size.width * 0.0,
        top: MediaQuery.of(context).size.height * 0.02,
        bottom: MediaQuery.of(context).size.height * 0.0,
      ),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Em caso de doença procurar:',
            style: new TextStyle(fontSize: 16),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Radio(
                  value: 0,
                  groupValue: doenca,
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      doenca = value;
                      this.doenca1 = 'Unidade de saúde';
                    });
                  }),
              Text(
                "Unidade de saúde",
                style: new TextStyle(fontSize: 14),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Radio(
                  value: 1,
                  groupValue: doenca,
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      doenca = value;
                      this.doenca1 = 'Benzedeira';
                    });
                  }),
              Text(
                "Benzedeira",
                style: new TextStyle(fontSize: 14),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Radio(
                  value: 2,
                  groupValue: doenca,
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      doenca = value;
                      this.doenca1 = 'Farmácia';
                    });
                  }),
              Text(
                "Farmácia",
                style: new TextStyle(fontSize: 14),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Radio(
                  value: 3,
                  groupValue: doenca,
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      doenca = value;
                      this.doenca1 = 'Outros';
                    });
                  }),
              Text(
                "Outros",
                style: new TextStyle(fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget Comunitario() {
    return Container(
      padding: EdgeInsets.all(0.0),
      margin: new EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0,
        right: MediaQuery.of(context).size.width * 0.0,
        top: MediaQuery.of(context).size.height * 0.02,
        bottom: MediaQuery.of(context).size.height * 0.0,
      ),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Participa de grupos comunitarios:',
            style: new TextStyle(fontSize: 16),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Radio(
                  value: 0,
                  groupValue: comunitario,
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      comunitario = value;
                      this.comunitario1 = 'Grupo Religioso';
                    });
                  }),
              Text(
                "Grupo Religioso",
                style: new TextStyle(fontSize: 14),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Radio(
                  value: 1,
                  groupValue: comunitario,
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      comunitario = value;
                      this.comunitario1 = 'Associações';
                    });
                  }),
              Text(
                "Associações",
                style: new TextStyle(fontSize: 14),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Radio(
                  value: 2,
                  groupValue: comunitario,
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      comunitario = value;
                      this.comunitario1 = 'Outro';
                    });
                  }),
              Text(
                "Outro ",
                style: new TextStyle(fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget Transporte() {
    return Container(
      padding: EdgeInsets.all(0.0),
      margin: new EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0,
        right: MediaQuery.of(context).size.width * 0.0,
        top: MediaQuery.of(context).size.height * 0.02,
        bottom: MediaQuery.of(context).size.height * 0.0,
      ),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Meio de trasporte que mais utiliza:',
            style: new TextStyle(fontSize: 16),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Radio(
                  value: 0,
                  groupValue: transporte,
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      transporte = value;
                      this.transporte1 = 'Onibus';
                    });
                  }),
              Text(
                "Onibus",
                style: new TextStyle(fontSize: 14),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Radio(
                  value: 1,
                  groupValue: transporte,
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      transporte = value;
                      this.transporte1 = 'Caminhão';
                    });
                  }),
              Text(
                "Caminhão",
                style: new TextStyle(fontSize: 14),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Radio(
                  value: 2,
                  groupValue: transporte,
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      transporte = value;
                      this.transporte1 = 'Carro';
                    });
                  }),
              Text(
                " Carro ",
                style: new TextStyle(fontSize: 14),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Radio(
                  value: 3,
                  groupValue: transporte,
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      transporte = value;
                      this.transporte1 = 'Carroça';
                    });
                  }),
              Text(
                " Carroça ",
                style: new TextStyle(fontSize: 14),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Radio(
                  value: 4,
                  groupValue: transporte,
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      transporte = value;
                      this.transporte1 = 'Outro';
                    });
                  }),
              Text(
                " Outro ",
                style: new TextStyle(fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget Salvar() {
    FlatButton(
        child: Text('Salvar'),
        onPressed: () {
          Navigator.of(context).pop();

          Map<String, dynamic> CadastroData = {
            'Nome': this.Nome,
            'Cnsn': this.CNSn,
            'Nome da Mãe': this.mae,
            'nacionalidade': this.nacionalidade1,
            'Sexo': this.sexo1,
            'Moradia': this.moradia1,
            'Energia': this.energia1,
            'Destino Lixo': this.destino1,
            'Tratamento de agua': this.trata_agua1,
            'Abastecimento': this.agua,
            'Esgoto': this.esgoto1,
            'Uf': this._ufresidencial,
            'Raça': this._raca,
            'Numero Residencial': this.endereco,
            'Endereço': this.endereco,
            'Bairro': this.bairro,
            'Cep': this.cep,
            'Nº Comodos': this.comodos,
            'Nome do Plano': this.nomeplanodesaude,
            'Alguem Possui Plano': this.plano1,
            'Participa de grupos comunitários': this.comunitario1,
            'Em caso de doença procura': this.doenca1,
            'Meio de trasporte': this.transporte1,
            'Quantas pessoas utilizam o plano': this.numerodepessoasplano,
            'Data de Nascimento': this._selectedDate,
          };

          crudObj.addData(CadastroData).then((result) {
            dialogTrigger(context);
          }).catchError((e) {
            print(e);
          });
        });
  }

  Future<bool> dialogTrigger(BuildContext context) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Salvo'),
            content: Text('Registro salvo com sucesso'),
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
              left: MediaQuery.of(context).size.width * 0.05,
              right: MediaQuery.of(context).size.width * 0.05,
              top: MediaQuery.of(context).size.height * 0.0,
              bottom: MediaQuery.of(context).size.height * 0.1,
            ),
            padding: EdgeInsets.all(0.0),
            child: new Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                      margin: new EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.0,
                        right: MediaQuery.of(context).size.width * 0.69,
                        top: MediaQuery.of(context).size.height * 0.020,
                        bottom: MediaQuery.of(context).size.height * 0.0,
                      ),
                      height: 60,
                      alignment: Alignment.centerRight,
                      child: FlatButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                      top: MediaQuery.of(context).size.height * 0.01,
                      bottom: MediaQuery.of(context).size.height * 0.03,
                    ),
                    child: Text(
                      "Cadastro",
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                        fontSize: 27,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  CNS(),
                  NomeCadastro(),
                  NomeMae(),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Expanded(
                      child: DataNascimento(),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                  ]),
                  Endereco(),
                  Row(children: [
                    Expanded(
                      child: NumeroResidencial(),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Bairro(),
                    )
                  ]),
                  Row(children: [
                    Expanded(
                      child: Cep(),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Text('UF:       '),
                    Uf(),
                  ]),
                ])),
        Container(
          margin: new EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.1,
            right: MediaQuery.of(context).size.width * 0.1,
            top: MediaQuery.of(context).size.height * 0.0,
            bottom: MediaQuery.of(context).size.height * 0.1,
          ),
          padding: EdgeInsets.all(0.0),
          child: new Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  margin: new EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.03,
                    bottom: MediaQuery.of(context).size.height * 0.03,
                  ),
                  child: Text(
                    "Cadastro",
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                      fontSize: 27,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                Nacionalidade(),
                Sexo(),
                Row(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Raça:                    ",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Raca(),
                  ],
                ),
                PlanodeSaude(),
                NomePlanoSaude(),
                NumerodePessoasPlano(),
              ]),
        ),
        Container(
          margin: new EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.1,
            right: MediaQuery.of(context).size.width * 0.1,
            top: MediaQuery.of(context).size.height * 0.0,
            bottom: MediaQuery.of(context).size.height * 0.1,
          ),
          padding: EdgeInsets.all(0.0),
          child: new Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  margin: new EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.03,
                    bottom: MediaQuery.of(context).size.height * 0.03,
                  ),
                  child: Text(
                    "Cadastro",
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                      fontSize: 27,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                Moradia(),
                Comodos(),
                EnergiaEletrica(),
              ]),
        ),
        Container(
          margin: new EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.1,
            right: MediaQuery.of(context).size.width * 0.1,
            top: MediaQuery.of(context).size.height * 0.0,
            bottom: MediaQuery.of(context).size.height * 0.2,
          ),
          padding: EdgeInsets.all(0.0),
          child: new Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  margin: new EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.03,
                    bottom: MediaQuery.of(context).size.height * 0.03,
                  ),
                  child: Text(
                    "Cadastro",
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                      fontSize: 27,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                TratamendodeAgua(),
                DestinodoLixo(),
              ]),
        ),
        Container(
          margin: new EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.1,
            right: MediaQuery.of(context).size.width * 0.1,
            top: MediaQuery.of(context).size.height * 0.0,
            bottom: MediaQuery.of(context).size.height * 0.1,
          ),
          padding: EdgeInsets.all(0.0),
          child: new Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  margin: new EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.03,
                    bottom: MediaQuery.of(context).size.height * 0.03,
                  ),
                  child: Text(
                    "Cadastro",
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                      fontSize: 27,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                Abastecimento(),
                DestinodeFezeseUrina(),
                Comunitario(),
              ]),
        ),
        Container(
          margin: new EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.1,
            right: MediaQuery.of(context).size.width * 0.1,
            top: MediaQuery.of(context).size.height * 0.0,
            bottom: MediaQuery.of(context).size.height * 0.0,
          ),
          padding: EdgeInsets.all(0.0),
          child: new Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  margin: new EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.03,
                    bottom: MediaQuery.of(context).size.height * 0.03,
                  ),
                  child: Text(
                    "Cadastro",
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                      fontSize: 27,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                Doenca(),
                Transporte(),
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

              Map<String, dynamic> CadastroData = {
                'Nome': this.Nome,
                'Cnsn': this.CNSn,
                'mae': this.mae,
                'nacionalidade': this.nacionalidade1,
                'Sexo': this.sexo1,
                'Moradia': this.moradia1,
                'Energia': this.energia1,
                'Destino Lixo': this.destino1,
                'Tratamento de agua': this.trata_agua1,
                'Abastecimento': this.agua,
                'Esgoto': this.esgoto1,
                'Uf': this._ufresidencial,
                'Raça': this._raca,
                'Numero Residencial': this.endereco,
                'Endereço': this.endereco,
                'Bairro': this.bairro,
                'Cep': this.cep,
                'Nº Comodos': this.comodos,
                'Nome do Plano': this.nomeplanodesaude,
                'Alguem Possui Plano': this.plano1,
                'Participa de grupos comunitários': this.comunitario1,
                'Em caso de doença procura': this.doenca1,
                'Meio de trasporte': this.transporte1,
                'Quantas pessoas utilizam o plano': this.numerodepessoasplano,
                'Data de Nascimento': this._selectedDate,
              };

              crudObj.addData(CadastroData).then((result) {
                dialogTrigger(context);
              }).catchError((e) {
                print(e);
              });
            })
      ],
      scrollDirection: Axis.horizontal,
      physics: ClampingScrollPhysics(),
    );
  }
}
