import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  SingingCharacter _character = SingingCharacter.brasileiro;
  String dropdownValue = 'Preto';

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro Paciente"),
      ),
      body: Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new TextFormField(
              obscureText: false,
              autofocus: false,
              decoration: new InputDecoration(
                  hintText: 'Cns do cidadão',
                  icon: new Icon(
                    Icons.person,
                    color: Colors.black,
                  )),
            ),
            new TextFormField(
              obscureText: false,
              autofocus: false,
              decoration: new InputDecoration(
                  hintText: 'Nome completo',
                  icon: new Icon(
                    Icons.person_outline,
                    color: Colors.black,
                  )),
            ),
            new TextFormField(
              obscureText: false,
              autofocus: false,
              decoration: new InputDecoration(
                  hintText: 'Nome completo da mãe',
                  icon: new Icon(
                    Icons.person_outline,
                    color: Colors.black,
                  )),
            ),
            new TextFormField(
              obscureText: false,
              autofocus: false,
              decoration: new InputDecoration(
                  hintText: 'Nome completo do pai',
                  icon: new Icon(
                    Icons.person_outline,
                    color: Colors.black,
                  )),
            ),
            ListTile(
              title: const Text('Brasileiro'),
              leading: Radio(
                value: SingingCharacter.brasileiro,
                groupValue: _character,
                onChanged: (SingingCharacter value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Estrangeiro'),
              leading: Radio(
                value: SingingCharacter.estrangeiro,
                groupValue: _character,
                onChanged: (SingingCharacter value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Naturalizado'),
              leading: Radio(
                value: SingingCharacter.naturalizado,
                groupValue: _character,
                onChanged: (SingingCharacter value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
            DropdownButton<String>(
              value: dropdownValue,
              icon: Icon(Icons.arrow_drop_down),
              iconSize: 19,
              elevation: 21,
              style: TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue = newValue;
                });
              },
              items: <String>['Preto', 'Branco', 'Indigena', 'Amarelo','Parda']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            ListTile(
              title: const Text('Feminino'),
              leading: Radio(
                value: SingingCharacter.feminino,
                groupValue: _character,
                onChanged: (SingingCharacter value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Masculino'),
              leading: Radio(
                value: SingingCharacter.masculino,
                groupValue: _character,
                onChanged: (SingingCharacter value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/////****************** os drops
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>['One', 'Two', 'Free', 'Four']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

//******************* Radios

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: Center(
          child: MyStatefulWidget(),
        ),
      ),
    );
  }
}

enum SingingCharacter { brasileiro, estrangeiro, naturalizado, feminino, masculino}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}
