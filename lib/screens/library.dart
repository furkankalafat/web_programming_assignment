import 'package:flutter/material.dart';
import 'package:login_check_app/models/book.dart';
import 'package:login_check_app/screens/addbook.dart';
import 'package:login_check_app/screens/bookdetail.dart';
import 'package:login_check_app/screens/signin.dart';
import 'package:login_check_app/services/apiservices.dart';
import 'package:login_check_app/utilites/slide_transition_left.dart';

class Library extends StatefulWidget {
  @override
  _LibraryState createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  final APIservices apiServices = APIservices();
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
              Expanded(flex: 8, child: SizedBox()),
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
                    Navigator.push(context, SlideLeftRoute(page: AddBook()));
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
            List<Book> posts = snapshot.data;
            return ListView(
              children: posts
                  .map(
                    (Book book) => ListTile(
                      title: Text(book.userName),
                      subtitle: Text(book.bookName),
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => BookDetail(
                            book: book,
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
