import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:login_check_app/models/api.services.dart';
import 'package:login_check_app/models/user.dart';

import '../models/api.services.dart';

class UserUi extends StatefulWidget {
  UserUi({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _UserState();
}

class _UserState extends State<UserUi> {
  List<User> user;

  @override
  void initState() {
    super.initState(); 
    debugPrint("INIT STATE");
    APIservices.createUser();
    APIservices.fetchUser().then((response) {
      debugPrint("Response");
      Iterable list = json.decode(response.body);
      List<User> userList = List<User>();
      userList = list.map((model) => User.fromObject(model)).toList();

      setState(() {
        debugPrint("user " + userList.toString());
        user = userList;
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
                
                })
          ],
        ),
      ),
    );
  }
}
