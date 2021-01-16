import 'package:flutter/material.dart';
import 'package:login_check_app/models/book.dart';
import 'package:login_check_app/models/login_request.dart';
import 'package:login_check_app/models/resultMessages/book_operation_result.dart';
import 'package:login_check_app/screens/addbook.dart';
import 'package:login_check_app/screens/signin.dart';
import 'package:login_check_app/services/apiservices.dart';
import 'package:login_check_app/utilites/slide_transition_left.dart';

// ignore: must_be_immutable
class Library extends StatefulWidget {
  LoginRequest loginRequest;
  Library(this.loginRequest);
  @override
  _LibraryState createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  IconData defaultIcon = Icons.thumb_up_off_alt;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.amber[800],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Welcome " + widget.loginRequest.userName,
                      style: TextStyle(color: Colors.teal),
                    ),
                  )),
              Expanded(flex: 6, child: SizedBox()),
              Expanded(
                flex: 6,
                child: Text(
                  "LIBRARY",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(width: 50),
              Expanded(
                flex: 1,
                child: IconButton(
                  icon: Icon(
                    Icons.add,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        SlideLeftRoute(page: AddBook(widget.loginRequest)));
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: FlatButton(
                  child: Text("Log Out"),
                  onPressed: () {
                    Navigator.push(context, SlideLeftRoute(page: SignIn()));
                  },
                ),
              ),
              SizedBox(width: 20),
            ],
          ),
        ),
      ),
      body: FutureBuilder(
        future: APIservices.getBooks(),
        builder: (BuildContext context, AsyncSnapshot<List<Book>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return SizedBox(height: 35);
                }
                return _buildBookList(snapshot.data[index]);
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  _buildBookList(Book book) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Container(
        margin: EdgeInsets.all(10),
        height: 125,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.amber[300]),
        child: Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //BOOKNAME PART

                  Text(
                    book.bookName,
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 5),

                  //USERNAME PART

                  Text(
                    book.userName,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      //READ INFO

                      Icon(Icons.bookmark),
                      Text("Read"),

                      SizedBox(width: 10),

                      //LIKE COUNT

                      Icon(Icons.thumb_up_alt),
                      Text("likeCount"),
                    ],
                  ),
                ],
              ),
            ),

            //COMMENT PART

            Padding(
              padding: EdgeInsets.fromLTRB(75, 15, 15, 0),
              child: Column(
                children: [
                  SizedBox(
                    width: 175,
                    child: Text(
                      book.comment,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void incrementLike(Book book, BuildContext context) async {
    book.userName = book.userName;
    book.bookName = book.bookName;
    book.likeCount = book.likeCount;
    book.comment = book.comment;
    BookOperationResult bookOperationResult =
        await APIservices.incrementLikeCount(book);

    if (bookOperationResult.isSuccess) {
      setState(() {
        debugPrint(defaultIcon.toString());
        book.likeCount++;
        defaultIcon = Icons.thumb_up;
      });
    } else {
      debugPrint("error");
    }
  }
}
