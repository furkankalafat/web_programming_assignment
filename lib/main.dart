import 'package:flutter/material.dart';
import 'package:login_check_app/UI/user.ui.dart';
import 'package:login_check_app/models/users.dart';

import 'UI/add.user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: AddUser(Users("", "", "")),
    );
  }
}
