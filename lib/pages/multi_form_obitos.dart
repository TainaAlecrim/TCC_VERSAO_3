import 'package:flutter/material.dart';
import 'package:flutter_login_demo/empty_state.dart';
import 'package:flutter_login_demo/form.dart';
import 'package:flutter_login_demo/user.dart';
import 'package:flutter_login_demo/pages/home_fichad.dart';

class MultiFormObitos extends StatefulWidget {
  @override
  _MultiFormState createState() => _MultiFormState();
}

class _MultiFormState extends State<MultiFormObitos> {
  List<UserForm> users = [];

  get crudObj => null;

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Obitos'),
        actions: <Widget>[

        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0x00000000),
              Color(0xFF30C0CC),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: users.length <= 0
            ? Center(
                child: EmptyState(
                  title: 'Clique no + ',
                  message: 'Para adicionar informações',
                ),
              )
            : ListView.builder(
                addAutomaticKeepAlives: true,
                itemCount: users.length,
                itemBuilder: (_, i) => users[i],
              ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: onAddForm,
        foregroundColor: Colors.white,
      ),
    );
  }

  ///on form user deleted
  void onDelete(User _user) {
    setState(() {
      var find = users.firstWhere(
        (it) => it.user == _user,
        orElse: () => null,
      );
      if (find != null) users.removeAt(users.indexOf(find));
    });
  }

  ///on add form
  void onAddForm() {
    setState(() {
      var _user = User();
      users.add(UserForm(
        user: _user,
        onDelete: () => onDelete(_user),
      ));
    });
  }

  ///on save forms

  void dialogTrigger(BuildContext context) {}
}
