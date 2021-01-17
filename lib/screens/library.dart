import 'package:flutter/material.dart';
import 'package:login_check_app/models/book.dart';
import 'package:login_check_app/models/composite_book_comment.dart';
import 'package:login_check_app/models/composite_object.dart';
import 'package:login_check_app/models/login_request.dart';
import 'package:login_check_app/models/resultMessages/book_operation_result.dart';
import 'package:login_check_app/screens/addbook.dart';
import 'package:login_check_app/screens/signin.dart';
import 'package:login_check_app/services/apiservices.dart';
import 'package:login_check_app/utilites/slide_transition_left.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/resultMessages/book_operation_result.dart';
import '../models/resultMessages/user_operation_result.dart';
import '../models/user.dart';
import '../services/apiservices.dart';

// ignore: must_be_immutable
class Library extends StatefulWidget {
  LoginRequest loginRequest;
  Library(this.loginRequest);
  @override
  _LibraryState createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  IconData defaultIcon = Icons.thumb_up_off_alt;
  List<String> commentList = [];
  List<TextEditingController> _controllers = [];
  List<Book> bookList = [];
  List<Book> filteredBookList = [];
  bool refreshReadInfo = false;
  String listIndex;
  String filterIndex;
  User user;
  @override
  void initState() {
    getBooks();
    getUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.amber[800],
          ),
          child: Column(
            children: [
              Row(
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
                      onPressed: () async {
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        prefs.remove('userName');
                        prefs.remove('password');
                        Navigator.pushReplacement(context, SlideLeftRoute(page: SignIn()));
                      },
                    ),
                  ),
                  SizedBox(width: 20),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.amber[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: FlatButton(
                        child: Text("Sort By A to Z"),
                        onPressed: () {
                          listIndex = "SortByAtoZ";
                          getBooks();
                        }),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.amber[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: FlatButton(
                        child: Text("Sort By Date (newest)"),
                        onPressed: () {
                          listIndex = "SortByDateNew";
                          getBooks();
                        }),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.amber[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: FlatButton(
                        child: Text("Sort By Date (oldest)"),
                        onPressed: () {
                          listIndex = "SortByDateOld";
                          getBooks();
                        }),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.amber[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: FlatButton(
                        child: Text("Sort By Likes"),
                        onPressed: () {
                          setState(() {
                            listIndex = "SortBylikes";
                            getBooks();
                          });
                        }),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.amber[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: FlatButton(
                        child: Text("Filter Likes"),
                        onPressed: () {
                          filterIndex = "FilterLikes";
                          _filterBooks();
                        }),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.amber[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: FlatButton(
                        child: Text("Filter Read"),
                        onPressed: () {
                          filterIndex = "FilterRead";
                          _filterBooks();
                        }),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.amber[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: FlatButton(
                        child: Text("Reset"),
                        onPressed: () {
                          listIndex = "default";
                          getBooks();
                        }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: filteredBookList.length == 0
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: filteredBookList.length,
              itemBuilder: (BuildContext context, int index) {
                _controllers.add(new TextEditingController());
                return _buildBookList(filteredBookList[index], index);
              },
            ),
    );
  }

  _filterBooks() async{
    await getUserInfo();
    setState(() {
      if (filterIndex == "FilterLikes") {
        filteredBookList = bookList.where((book) {
          bool control = user.likesBookList.contains(book.bookName);
          if (control)
            return true;
          else {
            return false;
          }
        }).toList();
      } else if (filterIndex == "FilterRead") {
        setState(() {
          filteredBookList = bookList.where((book) {
            bool control = user.readBookList.contains(book.bookName);
            if (control) {
              return true;
            } else {
              return false;
            }
          }).toList();
        });
      } else {
        getBooks();
      }
    });
  }

  _buildBookList(Book book, index) {
    splitComment(book);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 400, vertical: 20),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            height: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.amber[300]),
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

                          refreshReadInfo == false
                              ? FutureBuilder(
                                  future: readControl(
                                      book, widget.loginRequest.userName),
                                  builder: (BuildContext context,
                                      AsyncSnapshot<BookOperationResult>
                                          snapshot) {
                                    if (!snapshot.hasData) {
                                      return CircularProgressIndicator();
                                    } else {
                                      if (snapshot.data.isSuccess) {
                                        return Row(
                                          children: [
                                            Text("Already Read"),
                                            IconButton(
                                                icon: Icon(Icons.bookmark),
                                                onPressed: () => readUpdate(
                                                    book,
                                                    widget.loginRequest
                                                        .userName)),
                                          ],
                                        );
                                      } else {
                                        return Row(
                                          children: [
                                            Text("Not yet read"),
                                            IconButton(
                                                icon: Icon(Icons.bookmark),
                                                onPressed: () => readUpdate(
                                                    book,
                                                    widget.loginRequest
                                                        .userName)),
                                          ],
                                        );
                                      }
                                    }
                                  })
                              : FutureBuilder(
                                  future: readControl(
                                      book, widget.loginRequest.userName),
                                  builder: (BuildContext context,
                                      AsyncSnapshot<BookOperationResult>
                                          snapshot) {
                                    if (!snapshot.hasData) {
                                      return CircularProgressIndicator();
                                    } else {
                                      if (snapshot.data.isSuccess) {
                                        return Row(
                                          children: [
                                            Text("Already Read"),
                                            IconButton(
                                                icon: Icon(Icons.bookmark),
                                                onPressed: () => readUpdate(
                                                    book,
                                                    widget.loginRequest
                                                        .userName)),
                                          ],
                                        );
                                      } else {
                                        return Row(
                                          children: [
                                            Text("Not yet read"),
                                            IconButton(
                                                icon: Icon(Icons.bookmark),
                                                onPressed: () => readUpdate(
                                                    book,
                                                    widget.loginRequest
                                                        .userName)),
                                          ],
                                        );
                                      }
                                    }
                                  }),

                          SizedBox(width: 10),

                          //LIKE COUNT

                          IconButton(
                            icon: Icon(Icons.thumb_up_alt),
                            onPressed: () =>
                                like(book, widget.loginRequest.userName),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(book.likeCount.toString()),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                //COMMENT PART
                Flexible(
                  child: ListView.builder(
                      itemCount: commentList.length,
                      itemBuilder: (BuildContext context, index) {
                        return Padding(
                          padding: EdgeInsets.fromLTRB(75, 15, 15, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Flexible(
                                    child: Text(
                                      (index + 1).toString() + "-) ",
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                      maxLines: 4,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Flexible(
                                    flex: 3,
                                    child: Text(
                                      commentList[index],
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                      maxLines: 4,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
          TextFormField(
            controller: _controllers[index],
            style: TextStyle(
              fontSize: 15.0,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.0),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.amber,
                ),
                borderRadius: BorderRadius.circular(5.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.amber,
                ),
                borderRadius: BorderRadius.circular(5.0),
              ),
              disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.amber,
              )),
              hintStyle: TextStyle(color: Colors.black26),
              hintText: "Comment",
              fillColor: Colors.amber,
            ),
          ),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.bottomRight,
            child: FlatButton(
              color: Colors.amber,
              onPressed: () {
                addComment(book, index);
              },
              child: Text(
                "Add Comment",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> addComment(Book book, index) async {
    setState(() async {
      CompositeBookComment compositeBookComment =
          CompositeBookComment(book, _controllers[index].text);
      BookOperationResult bookOperationResult =
          await APIservices.newComment(compositeBookComment);
      debugPrint(
          "comment operation result = ${bookOperationResult.isSuccess}, message = ${bookOperationResult.message}");
      _controllers[index].clear();
      getBooks();
    });
  }

  void splitComment(Book book) {
    commentList = book.comment.split(",");
  }

  void getBooks() async {
    bookList = await APIservices.getBooks(listIndex);
    /*
    bookList.add(Book(
        userName: "testUser",
        bookName: "cukulata",
        likeCount: 5,
        comment: "testComment",
        createdDate: DateTime.now()));
    bookList.add(Book(
        userName: "testUser2",
        bookName: "testBook2",
        likeCount: 15,
        comment: "testComment2",
        createdDate: DateTime(2018, 9, 23)));
    bookList.add(Book(
        userName: "testUser3",
        bookName: "testBook3",
        likeCount: 3,
        comment: "testComment3",
        createdDate: DateTime(2020, 12, 05)));
    bookList.add(Book(
        userName: "testUser4",
        bookName: "testBook4",
        likeCount: 5,
        comment: "testComment4",
        createdDate: DateTime(2017, 02, 05)));
    bookList.add(Book(
        userName: "testUser5",
        bookName: "testBook5",
        likeCount: 21,
        comment: "testComment5",
        createdDate: DateTime(2012, 06, 28)));
*/
    setState(() {
      filteredBookList = bookList;
      // ignore: unnecessary_statements
      //bookList;
    });
  }

  void like(Book book, String userName) async {
    User user = new User(
        eMail: "test@gmail.com",
        userName: userName,
        name: "test",
        password: "test",
        likesBookList: "notFound",
        readBookList: "notFound");
    CompositeObject compositeObject = CompositeObject(book, user);
    BookOperationResult bookOperationResult =
        await APIservices.incrementLikeCount(compositeObject);
    if (bookOperationResult.isSuccess) {
      setState(() {
        getBooks();
        defaultIcon = Icons.thumb_up;
      });
    } else {
      debugPrint("error");
    }
  }

  Future<BookOperationResult> readControl(Book book, String userName) async {
    User user = new User(
        eMail: "test@gmail.com",
        userName: userName,
        name: "test",
        password: "test",
        likesBookList: "notFound",
        readBookList: "notFound");
    CompositeObject compositeObject = CompositeObject(book, user);
    BookOperationResult bookOperationResult =
        await APIservices.readControl(compositeObject);
    return bookOperationResult;
  }

  readUpdate(Book book, String userName) async {
    User user = new User(
        eMail: "test@gmail.com",
        userName: userName,
        name: "test",
        password: "test",
        likesBookList: "notFound",
        readBookList: "notFound");
    CompositeObject compositeObject = CompositeObject(book, user);
    UserOperationResult userOperationResult =
        await APIservices.readListUpdate(compositeObject);
    if (userOperationResult.isSuccess) {
      setState(() {
        refreshReadInfo = true;
        getBooks();
      });
    } else if (userOperationResult.message == "notYetRead") {
      setState(() {
        refreshReadInfo = true;
      });
    } else {
      debugPrint("error");
    }
  }

  Future<void> getUserInfo() async {
    user = await APIservices.userInfo(widget.loginRequest);
    /*
    user = User(
        eMail: "enesbayar@gmail.com",
        userName: "enesbayar",
        likesBookList: "cukulata,testBook3",
        readBookList: "testBook2,testBook4");
        */
    debugPrint("""
    UserName = ${user.userName}
    likesList = ${user.likesBookList}
    readList = ${user.readBookList}
    """);
  }
}
