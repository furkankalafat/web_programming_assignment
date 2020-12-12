import 'package:flutter/material.dart';
import 'package:login_check_app/models/book.dart';
import 'package:login_check_app/models/login_request.dart';
import 'package:login_check_app/models/resultMessages/book_operation_result.dart';
import 'package:login_check_app/screens/library.dart';
import 'package:login_check_app/services/apiservices.dart';
import 'package:login_check_app/utilites/slide_transition_left.dart';

class AddBook extends StatefulWidget {
  LoginRequest loginRequest;
  AddBook(this.loginRequest);
  @override
  _AddBookState createState() => _AddBookState();
}

class _AddBookState extends State<AddBook> {
  var bookNameController = TextEditingController();
  var commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 50),
            Container(
              width: MediaQuery.of(context).size.width / 3.7,
              color: Colors.amber[50],
              child: TextField(
                controller: bookNameController,
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
                  hintText: "Bookname",
                  fillColor: Colors.amber[50],
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 150,
              width: MediaQuery.of(context).size.width / 3.7,
              color: Colors.amber[50],
              child: TextField(
                controller: commentController,
                style: TextStyle(
                  fontSize: 15.0,
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 10, bottom: 150),
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
                  hintText: "Comment",
                  fillColor: Colors.amber[50],
                ),
              ),
            ),
            SizedBox(height: 20),
            FlatButton(
              color: Colors.amber,
              onPressed: () {
                setState(() {
                  String bookName = bookNameController.text;
                  String comment = commentController.text;

                  createBook(widget.loginRequest, bookName, 0, comment, context);
                });
              },
              child: Text(
                "Create Book",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void createBook(LoginRequest loginRequest,String bookName,int likeCount, String comment,
    BuildContext context) async {
  Book book = Book(userName: loginRequest.userName, bookName: bookName, likeCount: likeCount, comment: comment);

  BookOperationResult bookOperationResult = await APIservices.createBook(book);

  debugPrint("BookOperationResult isSuccess  ${bookOperationResult.isSuccess}");
   if (bookOperationResult.message == "Empty BookName") {
    debugPrint("Empty BookName");
    showMessage(context, "Bookname cannot be empty");
  }  else {
    debugPrint("Book Created");
    showMessageSuccess(context, loginRequest);
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

Future<void> showMessageSuccess(BuildContext context, LoginRequest loginRequest) {
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
            Text("Book has been created",
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
              "Go Library",
              style: TextStyle(color: Colors.black),
            ),
            onPressed: () {
              Navigator.push(context, SlideLeftRoute(page: Library(loginRequest)));
            },
          ),
        ],
      );
    },
  );
}
