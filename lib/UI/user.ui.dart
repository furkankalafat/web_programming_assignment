import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:login_check_app/services/api.services.dart';
import 'package:login_check_app/models/user.dart';

import '../services/api.services.dart';

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
    //APIservices.loginUser();
    //APIservices.createUser();
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
