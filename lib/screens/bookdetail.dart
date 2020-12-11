import 'package:flutter/material.dart';
import 'package:login_check_app/models/book.dart';

class BookDetail extends StatelessWidget {
  final Book book;
  BookDetail({@required this.book});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.bookName),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: <Widget>[
              Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ListTile(
                      title: Text("Bookname"),
                      subtitle: Text(book.bookName),
                    ),
                    ListTile(
                      title: Text("Username"),
                      subtitle: Text(book.userName),
                    ),
                    ListTile(
                      leading: Icon(Icons.thumb_up),
                      title: Text("${book.likeCount}"),
                    ),
                    ListTile(
                      title: Text("Comment"),
                      subtitle: Text(book.comment),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
