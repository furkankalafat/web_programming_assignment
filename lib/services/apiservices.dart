import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:login_check_app/models/book.dart';
import 'package:login_check_app/models/composite_book_comment.dart';
import 'package:login_check_app/models/composite_object.dart';
import 'package:login_check_app/models/login_request.dart';
import 'package:login_check_app/models/resultMessages/book_operation_result.dart';
import 'package:login_check_app/models/resultMessages/login_result.dart';
import 'package:login_check_app/models/resultMessages/user_operation_result.dart';
import 'package:login_check_app/models/user.dart';

class APIservices {
  static String createUserUrl = "";
  static String loginUserUrl = "";
  static String addBookUrl = "";
  static String listBookUrl = "";
  static String incrementLikeCountUrl =
      "";
  static String readListUpdateUrl = "";
  static String writeCommentToFileUrl =
      "";
  static String readControlUrl =
      "";
  static String userInfoUrl = "";

  static Future<UserOperationResult> createUser(User user) async {
    debugPrint("CreateUser");
    final http.Response response = await http.post(
      createUserUrl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Access-Control-Allow-Origin": "*",
      },
      body: jsonEncode(user.toJson()),
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

  static Future<BookOperationResult> incrementLikeCount(
      CompositeObject compositeObject) async {
    debugPrint("incrementLikeCount");
    debugPrint(
        "CompositeOBject book = ${compositeObject.book}, user = ${compositeObject.user}");
    final http.Response response = await http.post(
      incrementLikeCountUrl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Access-Control-Allow-Origin": "*",
      },
      body: jsonEncode(compositeObject.toMap()),
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

  static Future<List<Book>> getBooks(String listIndex) async {
    http.Response res = await http.get(
      listBookUrl,
    );
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Book> books =
          body.map((dynamic item) => Book.fromJson(item)).toList();
      books.forEach((element) { 
       debugPrint("DateTime = " +element.createdDate.toString());
      });
      if (listIndex == "SortByAtoZ") {
        books.sort((a, b) {
          return a.bookName.toLowerCase().compareTo(b.bookName.toLowerCase());
        });
      } else if (listIndex == "SortByDateNew") {
        books.sort((a, b) {
          return b.createdDate.compareTo(a.createdDate);
        });
      } else if (listIndex == "SortByDateOld") {
        books.sort((a, b) {
          return a.createdDate.compareTo(b.createdDate);
        });
      } else if (listIndex == "SortBylikes") {
        books.sort((a, b) {
          return b.likeCount.compareTo(a.likeCount);
        });
      }
      return books;
    } else {
      throw "Can't get books";
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

  static Future<UserOperationResult> readListUpdate(
      CompositeObject compositeObject) async {
    debugPrint("readListUpdate");
    final http.Response response = await http.post(
      readListUpdateUrl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Access-Control-Allow-Origin": "*",
      },
      body: jsonEncode(compositeObject.toMap()),
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

  static Future<BookOperationResult> newComment(
      CompositeBookComment compositeBookComment) async {
    debugPrint("newComment");
    final http.Response response = await http.post(
      writeCommentToFileUrl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Access-Control-Allow-Origin": "*",
      },
      body: jsonEncode(compositeBookComment.toMap()),
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

  static Future<BookOperationResult> readControl(
      CompositeObject compositeObject) async {
    debugPrint("readControl");
    final http.Response response = await http.post(
      readControlUrl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Access-Control-Allow-Origin": "*",
      },
      body: jsonEncode(compositeObject.toMap()),
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

  static Future<User> userInfo(
      LoginRequest loginRequest) async {
    debugPrint("readControl");
    final http.Response response = await http.post(
      userInfoUrl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Access-Control-Allow-Origin": "*",
      },
      body: jsonEncode(loginRequest.toMap()),
    );

    if (response.statusCode == 200) {
      debugPrint("http response" + response.body);
      User user = User.fromObject(jsonDecode(response.body));
      return user;
    } else {
      return User();
    }
  }
}
