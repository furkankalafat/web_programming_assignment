import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:login_check_app/models/book.dart';
import 'package:login_check_app/models/login_request.dart';
import 'package:login_check_app/models/resultMessages/book_operation_result.dart';
import 'package:login_check_app/models/resultMessages/login_result.dart';
import 'package:login_check_app/models/resultMessages/user_operation_result.dart';
import 'package:login_check_app/models/user.dart';

class APIservices {
  static String createUserUrl = "https://192.168.1.35:5001/api/user/create";
  static String loginUserUrl = "https://192.168.1.35:5001/api/login/login";
  static String addBookUrl = "";
  static String listBookUrl = "";

  static Future<UserOperationResult> createUser(User user) async {
    debugPrint("CreateUser");
    final http.Response response = await http.post(
      createUserUrl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Access-Control-Allow-Origin": "*",
      },
      body: jsonEncode(user.toMap()),
    );

    if (response.statusCode == 200) {
      debugPrint("http response" + response.body);
      UserOperationResult userOperationResult =
          UserOperationResult.fromObject(jsonDecode(response.body));
      return userOperationResult;
    } else {
      return (UserOperationResult.fromObject({
        "isSuccess": false,
      }));
    }
  }

  static Future<LoginResult> loginUser(LoginRequest loginRequest) async {
    debugPrint("LoginUser");
    final http.Response response = await http.post(
      loginUserUrl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Access-Control-Allow-Origin": "*",
      },
      body: jsonEncode(loginRequest.toMap()),
    );

    if (response.statusCode == 200) {
      debugPrint("http response" + response.body);
      LoginResult loginResult =
          LoginResult.fromObject(jsonDecode(response.body));
      return loginResult;
    } else {
      return (LoginResult.fromObject(
          {"isSuccess": false, "message": "Bad Request"}));
    }
  }

  static Future<BookOperationResult> createBook(Book book) async {
    debugPrint("CreateUser");
    final http.Response response = await http.post(
      addBookUrl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Access-Control-Allow-Origin": "*",
      },
      body: jsonEncode(book.toJson()),
    );

    if (response.statusCode == 200) {
      debugPrint("http response" + response.body);
      BookOperationResult bookOperationResult =
          BookOperationResult.fromObject(jsonDecode(response.body));
      return bookOperationResult;
    } else {
      return (BookOperationResult.fromObject({
        "isSuccess": false,
      }));
    }
  }

  Future<List<Book>> getBooks() async {
    Response res = await get(listBookUrl);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Book> books =
          body.map((dynamic item) => Book.fromJson(item)).toList();
      debugPrint("hallettik");
      return books;
    } else {
      throw "Can't get books";
    }
  }
}
