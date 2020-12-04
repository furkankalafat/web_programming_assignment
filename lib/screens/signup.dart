import 'package:flutter/material.dart';
import 'package:login_check_app/models/resultMessages/user_operation_result.dart';
import 'package:login_check_app/services/api.services.dart';
import 'package:login_check_app/models/user.dart';
import 'package:login_check_app/screens/signin.dart';
import 'package:login_check_app/utilites/slide_transition_left.dart';
import 'package:login_check_app/utilites/slide_transition_right.dart';

class SignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var eMailController = TextEditingController();
  var userNameController = TextEditingController();
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50],
      body: Padding(
        padding:
            EdgeInsets.only(top: 60.0, bottom: 60.0, left: 120.0, right: 120.0),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
          elevation: 5.0,
          child: Container(
            child: Row(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width / 3.3,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.amber[800],
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: 85.0, right: 50.0, left: 50.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 120.0,
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Text(
                              "Already have an account? Login from the button below.",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50.0,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.amber[400]),
                            child: FlatButton(
                              onPressed: () {
                                setState(() {
                                  Navigator.push(
                                      context, SlideLeftRoute(page: SignIn()));
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  "Sign In",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: 15.0, right: 70.0, left: 70.0, bottom: 10.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 60),
                      Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Colors.amber,
                            fontWeight: FontWeight.w600,
                            fontSize: 35.0,
                            fontFamily: 'Merriweather'),
                      ),
                      const SizedBox(height: 20.0),

                      //USERNAME

                      LayoutBuilder(
                        builder:
                            (BuildContext context, BoxConstraints constraints) {
                          return Row(
                            children: <Widget>[
                              Container(
                                width: 80.0,
                                child: Text(
                                  "Username",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(color: Colors.amber),
                                ),
                              ),
                              SizedBox(
                                width: 40.0,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 3.7,
                                color: Colors.amber[50],
                                child: TextField(
                                  controller: userNameController,
                                  style: TextStyle(
                                    fontSize: 15.0,
                                  ),
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(10.0),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.amber[50],
                                      ),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.amber[50],
                                      ),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    hintStyle: TextStyle(color: Colors.black26),
                                    hintText: "furkankalafat",
                                    fillColor: Colors.amber[50],
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),

                      SizedBox(height: 20.0),

                      //NAME

                      LayoutBuilder(
                        builder:
                            (BuildContext context, BoxConstraints constraints) {
                          return Row(
                            children: <Widget>[
                              Container(
                                width: 80.0,
                                child: Text(
                                  "Name",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(color: Colors.amber),
                                ),
                              ),
                              SizedBox(
                                width: 40.0,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 3.7,
                                color: Colors.amber[50],
                                child: TextField(
                                  controller: nameController,
                                  style: TextStyle(
                                    fontSize: 15.0,
                                  ),
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(10.0),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.amber[50],
                                      ),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.amber[50],
                                      ),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    hintText: "Furkan",
                                    hintStyle: TextStyle(color: Colors.black26),
                                    fillColor: Colors.amber[50],
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),

                      SizedBox(height: 20.0),

                      //E-MAİL
                      LayoutBuilder(
                        builder:
                            (BuildContext context, BoxConstraints constraints) {
                          return Row(
                            children: <Widget>[
                              Container(
                                width: 80.0,
                                child: Text(
                                  "Email",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(color: Colors.amber),
                                ),
                              ),
                              SizedBox(
                                width: 40.0,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 3.7,
                                color: Colors.amber[50],
                                child: TextField(
                                  controller: eMailController,
                                  style: TextStyle(
                                    fontSize: 15.0,
                                  ),
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(10.0),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.amber[50],
                                      ),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.amber[50],
                                      ),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    hintText: "anything@gmail.com",
                                    hintStyle: TextStyle(color: Colors.black26),
                                    fillColor: Colors.amber[50],
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),

                      SizedBox(height: 20.0),

                      //PASSWORD
                      LayoutBuilder(
                        builder:
                            (BuildContext context, BoxConstraints constraints) {
                          return Row(
                            children: <Widget>[
                              Container(
                                width: 80.0,
                                child: Text(
                                  "Password",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(color: Colors.amber),
                                ),
                              ),
                              SizedBox(
                                width: 40.0,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 3.7,
                                color: Colors.amber[50],
                                child: TextField(
                                  obscureText: true,
                                  controller: passwordController,
                                  style: TextStyle(
                                    fontSize: 15.0,
                                  ),
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(10.0),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.amber[50],
                                      ),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.amber[50],
                                      ),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    hintText: "*********",
                                    hintStyle: TextStyle(color: Colors.black26),
                                    fillColor: Colors.amber[50],
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),

                      SizedBox(height: 20.0),

                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(width: 270),
                          FlatButton(
                            color: Colors.white,
                            onPressed: () {
                              setState(() {
                                eMailController.clear();
                                nameController.clear();
                                passwordController.clear();
                                userNameController.clear();
                              });
                            },
                            child: Text("Cancel"),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          FlatButton(
                            color: Colors.amber,
                            onPressed: () {
                              setState(() {
                                String eMail = eMailController.text;
                                String name = nameController.text;
                                String password = passwordController.text;
                                String userName = userNameController.text;

                                createUser(
                                    eMail, userName, name, password, context);
                              });
                            },
                            child: Text(
                              "Create Account",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void createUser(String eMail, String userName, String name, String password,
      BuildContext context) async {
    User user = User(eMail, userName, name, password);
    UserOperationResult userOperationResult =
        await APIservices.createUser(user);
    debugPrint(
        "UserOperationResult isSuccess  ${userOperationResult.isSuccess}");
    if (userOperationResult.message == "Empty UserName") {
      debugPrint("Empty UserName");
      showMessage(context, "Username cannot be empty");
    } else if (userOperationResult.message == "Empty Name") {
      debugPrint("Empty Name");
      showMessage(context, "Name cannot be empty");
    } else if (userOperationResult.message == "Empty eMail") {
      debugPrint("Empty eMail");
      showMessage(context, "Email cannot be empty");
    } else if (userOperationResult.message == "Empty Password") {
      debugPrint("Empty password");
      showMessage(context, "Password cannot be empty");
    } else {
      debugPrint("User Created");
      showMessageSuccess(context);
    }
  }

  Future<void> showMessage(BuildContext context, String message) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          backgroundColor: Color(0xFFfbc02d),
          content: Text(message,
              style: TextStyle(
                color: Color(0xFF0088a3),
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              )),
          actions: <Widget>[
            FlatButton(
              child: Text(
                "Close",
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> showMessageSuccess(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          backgroundColor: Color(0xFFfbc02d),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Your account has been created",
                  style: TextStyle(
                    color: Color(0xFF0088a3),
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  )),
              Text("You can login",
                  style: TextStyle(
                    color: Color(0xFF0088a3),
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  )),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                "Close",
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text(
                "Sign In",
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                Navigator.push(context, SlideLeftRoute(page: SignIn()));
              },
            ),
          ],
        );
      },
    );
  }
}
