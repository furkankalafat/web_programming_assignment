import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:login_check_app/models/user.dart';

class APIservices {

  static String createUserUrl = "https://192.168.1.38:5001/api/user/create";
  static String loginUserUrl = "https://192.168.1.38:5001/api/login/login";

  static void  createUser() async{
    User user = new User("enesbayar03@gmail.com","enesbayarr","enes","asde");
    
    debugPrint("CreateUser");
  final http.Response response = await http.post(
    createUserUrl,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      "Access-Control-Allow-Origin": "*",
    },
    body: jsonEncode(user.toMap()),

  );
  debugPrint("http response" + response.body);
  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    debugPrint("value" + response.body);
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    //throw Exception('Failed to load album');
  }
  }
  
  static void loginUser() async {
  debugPrint("LoginUser");
  final http.Response response = await http.post(
    loginUserUrl,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      "Access-Control-Allow-Origin": "*",
    },
    body: jsonEncode(<String, String>{
      'userName': 'enesbayar',
      'password': 'test'
    }),
  );
  debugPrint("http response" + response.body);
  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    debugPrint("value" + response.body);
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    //throw Exception('Failed to load album');
  }
  
}
}
