import 'package:flutter/material.dart';
//import 'package:flutter_localizations/flutter_localizations.dart';
import 'dart:async';

void main() {
  runApp(
    MaterialApp(
      /*localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],*/
      supportedLocales: [const Locale('pt', 'BR')],
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  String _value = '';

  Future _selectDate() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2019),
        lastDate: DateTime(2020));
    if (picked != null) setState(() => _value = picked.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exemplo localização'),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(_value),
              RaisedButton(
                onPressed: _selectDate,
                child: Text('CLIQUE'),
              )
            ],
          ),
        ),
      ),
    );
  }
}