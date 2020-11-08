import 'package:flutter/material.dart';
import 'package:login_check_app/models/users.dart';

class AddUser extends StatefulWidget {
  final Users users;
  AddUser(this.users);

  @override
  State<StatefulWidget> createState() => _AddUserState(users);
}

class _AddUserState extends State<AddUser> {
  Users users;
  _AddUserState(this.users);
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var userNameController = TextEditingController();
  var passwordController = TextEditingController();
  var textStyle = TextStyle();
  @override
  Widget build(BuildContext context) {
    firstNameController.text = users.firstName;
    lastNameController.text = users.lastName;
    userNameController.text = users.userName;
    passwordController.text = users.password;
    textStyle = Theme.of(context).textTheme.title;
    return _signUp();
  }

  Widget _signUp() {
    return ListView(
      children: [
        TextField(
          controller: firstNameController,
          style: textStyle,
          onChanged: null,
          decoration: InputDecoration(
              labelText: "FirstName",
              labelStyle: textStyle,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              )),
        ),
        SizedBox(
          height: 16.0,
        ),
        TextField(
          controller: lastNameController,
          style: textStyle,
          onChanged: null,
          decoration: InputDecoration(
              labelText: "LastName",
              labelStyle: textStyle,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              )),
        ),
        SizedBox(
          height: 16.0,
        ),
        TextField(
          controller: userNameController,
          style: textStyle,
          onChanged: null,
          decoration: InputDecoration(
              labelText: "UserName",
              labelStyle: textStyle,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              )),
        ),
        SizedBox(
          height: 16.0,
        ),
        TextField(
          obscureText: true,
          controller: passwordController,
          style: textStyle,
          onChanged: null,
          decoration: InputDecoration(
              labelText: "PassWord",
              labelStyle: textStyle,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              )),
        ),
      ],
    );
  }
}
