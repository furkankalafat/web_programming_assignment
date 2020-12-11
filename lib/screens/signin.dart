import 'package:flutter/material.dart';
import 'package:login_check_app/models/resultMessages/login_result.dart';
import 'package:login_check_app/screens/library.dart';
import 'package:login_check_app/services/apiservices.dart';
import 'package:login_check_app/models/login_request.dart';
import 'package:login_check_app/screens/signup.dart';
import 'package:login_check_app/utilites/slide_transition_left.dart';
import 'package:login_check_app/utilites/slide_transition_right.dart';

class SignIn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  var userNameController = TextEditingController();
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
                              "Don't have an account. Create one!",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
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
                                      context, SlideRightRoute(page: SignUp()));
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  "Create Account",
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
                        "Sign In",
                        style: TextStyle(
                            color: Colors.amber,
                            fontWeight: FontWeight.w600,
                            fontSize: 35.0,
                            fontFamily: 'Merriweather'),
                      ),
                      const SizedBox(height: 20.0),

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
                                  keyboardType: TextInputType.visiblePassword,
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
                                userNameController.clear();
                                passwordController.clear();
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
                                /*login(userNameController.text,
                                    passwordController.text, context);*/
                                Navigator.push(
                                    context, SlideLeftRoute(page: Library()));
                              });
                            },
                            child: Text(
                              "Login",
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

  void login(String userName, String password, BuildContext context) async {
    LoginRequest loginRequest = LoginRequest(userName, password);
    LoginResult loginResult = await APIservices.loginUser(loginRequest);
    debugPrint("loginResult = " + loginResult.isSuccess.toString());
    if (loginResult.message == "User Not Found") {
      debugPrint("UserNotFound");
      showMessage(context, "User Not Found");
    } else if (loginResult.message == "Wrong Password") {
      debugPrint("Wrong Password");
      showMessage(context, "Wrong Password");
    } else {
      debugPrint("Login Successful");
      showMessage(context, "Login Successful");
    }
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
              letterSpacing: 1.5,
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
