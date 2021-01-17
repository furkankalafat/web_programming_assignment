import 'package:flutter/material.dart';
import 'package:login_check_app/models/login_request.dart';
import 'package:login_check_app/screens/library.dart';
import 'package:login_check_app/screens/signin.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var userName = prefs.getString('userName');
  var password = prefs.getString('password');
  print(userName);
  print(password);
  LoginRequest loginRequest = LoginRequest(userName, password);
  runApp((userName == null && password == null) ? MyApp(false,loginRequest): MyApp(true, loginRequest));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  final LoginRequest loginRequest;
  MyApp(this.isLoggedIn, this.loginRequest);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: isLoggedIn == false ? SignIn() : Library(loginRequest) ,
    );
  }
}
