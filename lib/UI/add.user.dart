import 'package:flutter/material.dart';
import 'package:login_check_app/models/user.dart';

class AddUser extends StatefulWidget {
  final User user;
  AddUser(this.user);

  @override
  State<StatefulWidget> createState() => _AddUserState(user);
}

class _AddUserState extends State<AddUser> {
  User user;
  _AddUserState(this.user);
  var eMailController = TextEditingController();
  var userNameController = TextEditingController();
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var textStyle = TextStyle();
  @override
  Widget build(BuildContext context) {
    eMailController.text = user.eMail;
    userNameController.text = user.userName;
    nameController.text = user.name;
    passwordController.text = user.password;
    textStyle = Theme.of(context).textTheme.title;
    return _signUp();
  }

  Widget _signUp() {
    return ListView(
      children: [
        TextField(
          controller: eMailController,
          style: textStyle,
          onChanged: null,
          decoration: InputDecoration(
              labelText: "e-Mail",
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
              labelText: "User Name",
              labelStyle: textStyle,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              )),
        ),
        SizedBox(
          height: 16.0,
        ),
        TextField(
          controller: nameController,
          style: textStyle,
          onChanged: null,
          decoration: InputDecoration(
              labelText: "Name",
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
              labelText: "Password",
              labelStyle: textStyle,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              )),
        ),
      ],
    );
  }
}
