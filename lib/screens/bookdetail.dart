import 'package:flutter/material.dart';
import 'package:login_check_app/models/book.dart';
import 'package:login_check_app/models/resultMessages/book_operation_result.dart';
import 'package:login_check_app/services/apiservices.dart';

class BookDetail extends StatefulWidget {
  final Book book;
  BookDetail({@required this.book});

  @override
  _BookDetailState createState() => _BookDetailState();
}

class _BookDetailState extends State<BookDetail> {
  IconData defaultIcon = Icons.thumb_up_off_alt;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.book.bookName),
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
                      title: Text("Username:"),
                      subtitle: Text(widget.book.userName),
                    ),
                    ListTile(
                      title: Text("Bookname:"),
                      subtitle: Text(widget.book.bookName),
                    ),
                    ListTile(
                      title: Text("Comment:"),
                      subtitle: Text(widget.book.comment),
                    ),
                    if (defaultIcon.toString() == "IconData(U+0EA7A)") ...[
                      ListTile(
                        onTap: () => incrementLike(widget.book, context),
                        leading: Icon(defaultIcon),
                        title: Text("${widget.book.likeCount}"),
                      ),
                    ] else ...[
                      ListTile(
                        leading: Icon(defaultIcon),
                        title: Text("${widget.book.likeCount}"),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
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
