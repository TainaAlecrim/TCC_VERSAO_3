import 'package:flutter/material.dart';
import 'package:flutter_login_demo/map.page.dart';
import 'package:flutter_login_demo/pages/home_cadastro.dart';
import 'package:flutter_login_demo/pages/home_fichad.dart';
import 'package:flutter_login_demo/pages/home_historico.dart';
import 'package:flutter_login_demo/services/authentication.dart';
import 'package:flutter_login_demo/pages/multi_form_obitos.dart';
import 'package:flutter_login_demo/pages/login_signup_page.dart';
import 'package:flutter_login_demo/pages/multi_form_hosp.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_login_demo/models/todo.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class Historico extends StatefulWidget {
  Historico({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;

  @override
  State<StatefulWidget> createState() => new _HistoricoState();
}

class _HistoricoState extends State<Historico> {
  List<Todo> _todoList;

  final FirebaseDatabase _database = FirebaseDatabase.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final _textEditingController = TextEditingController();
  StreamSubscription<Event> _onTodoAddedSubscription;
  StreamSubscription<Event> _onTodoChangedSubscription;

  Query _todoQuery;

  get children => null;

  //bool _isEmailVerified = false;

  @override
  void initState() {
    super.initState();

    //_checkEmailVerification();

    _todoList = new List();
    _todoQuery = _database
        .reference()
        .child("todo")
        .orderByChild("userId")
        .equalTo(widget.userId);
    _onTodoAddedSubscription = _todoQuery.onChildAdded.listen(onEntryAdded);
    _onTodoChangedSubscription =
        _todoQuery.onChildChanged.listen(onEntryChanged);
  }

  @override
  void dispose() {
    _onTodoAddedSubscription.cancel();
    _onTodoChangedSubscription.cancel();
    super.dispose();
  }

  onEntryChanged(Event event) {
    var oldEntry = _todoList.singleWhere((entry) {
      return entry.key == event.snapshot.key;
    });

    setState(() {
      _todoList[_todoList.indexOf(oldEntry)] =
          Todo.fromSnapshot(event.snapshot);
    });
  }

  onEntryAdded(Event event) {
    setState(() {
      _todoList.add(Todo.fromSnapshot(event.snapshot));
    });
  }

  signOut() async {
    try {
      await widget.auth.signOut();
      widget.logoutCallback();
    } catch (e) {
      print(e);
    }
  }

  addNewTodo(String todoItem) {
    if (todoItem.length > 0) {
      Todo todo = new Todo(todoItem.toString(), widget.userId, false);
      _database.reference().child("todo").push().set(todo.toJson());
    }
  }

  updateTodo(Todo todo) {
    //Toggle completed
    todo.completed = !todo.completed;
    if (todo != null) {
      _database.reference().child("todo").child(todo.key).set(todo.toJson());
    }
  }

  deleteTodo(String todoId, int index) {
    _database.reference().child("todo").child(todoId).remove().then((_) {
      print("Delete $todoId successful");
      setState(() {
        _todoList.removeAt(index);
      });
    });
  }

  /*  title: FlatButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.exit_to_app,
                  color: Colors.black54,
                  size: 35,
                  semanticLabel: '',
                ),
              ],
            ),
            onPressed: signOut),*/
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text(
          "Historico",
          style: TextStyle(fontSize: 18, color: Colors.white70),
        ),
        elevation: 10,
        backgroundColor: Colors.teal,
        actions: [
        ],
      ),
      resizeToAvoidBottomInset: true,
      body: Container(
                    decoration: new BoxDecoration(
                gradient: new LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(255, 173,216,230),
                    Color.fromARGB(255, 65,150,150)
                  ],
                )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[

            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 30),
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 90.0,
                child: Image.asset('assets/imagem.png'),
              ),
            ),

            // primeiro botão
            Container(
              margin: new EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.05,
                right: MediaQuery.of(context).size.width * 0.05,
                top: MediaQuery.of(context).size.height * 0.0,
                bottom: MediaQuery.of(context).size.height * 0.0,
              ),
              height: 80,
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.3, 1],
                  colors: [
                     Colors.black38,
                     Colors.black38,
                  ],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: SizedBox.expand(
                child: FlatButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.history,
                        color: Colors.white70,
                        size: 50,
                      ),
                      Text(
                        "           Ficha A             ",
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Cadastro()),
                    );
                  },
                ),
              ),
            ),

            // terceiro botão

            Container(
              margin: new EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.05,
                right: MediaQuery.of(context).size.width * 0.05,
                top: MediaQuery.of(context).size.height * 0.0,
                bottom: MediaQuery.of(context).size.height * 0.0,
              ),
              height: 80,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.3, 1.0],
                  colors: [
                     Colors.black38,
                     Colors.black38,
                  ],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: SizedBox.expand(
                child: FlatButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.history,
                        color: Colors.white70,
                        size: 50,
                      ),
                      Text(
                        "           Ficha D             ",
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FichaD()),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

