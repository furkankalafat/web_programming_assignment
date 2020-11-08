import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:login_check_app/models/api.services.dart';
import 'package:login_check_app/models/users.dart';

class UserUi extends StatefulWidget {
  UserUi({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _UserState();
}

class _UserState extends State<UserUi> {
  List<Users> users;

  getUser() {
    APIservices.fetchUser().then((response) {
      Iterable list = json.decode(response.body);
      List<Users> userList = List<Users>();
      userList = list.map((model) => Users.fromObject(model)).toList();

      setState(() {
        users = userList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Auth'),
      ),
      body: Container(
        child: Column(
          children: [
            TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nickname',
                ),
                onSubmitted: (String value) async {
                  await showDialog<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                            title: const Text('Thanks!'),
                            actions: <Widget>[
                              FlatButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('OK'),
                              )
                            ]);
                      });
                })
          ],
        ),
      ),
    );
  }
}
