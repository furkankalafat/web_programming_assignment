
class Book {
  String userName;
  String bookName;
  int likeCount = 0;
  String comment;
  DateTime createdDate;
  
  Book({
    this.userName,
    this.bookName,
    this.likeCount,
    this.comment, 
    this.createdDate,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      userName: json["userName"] as String,
      bookName: json["bookName"] as String,
      likeCount: json["likeCount"] as int,
      comment: json["comment"] as String,
      createdDate: DateTime.tryParse(json["createdDate"].toString()),
    );
  }

  Map<String, dynamic> toJson() => {
        "userName": userName,
        "bookName": bookName,
        "likeCount": likeCount,
        "comment": comment,
      };

  /*Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["userName"] = _userName;
    map["bookName"] = _bookName;
    map["likeCount"] = _likeCount;
    map["comment"] = _comment;
    return map;
  }

  Book.fromObject(dynamic o) {
    this._userName = o["userName"];
    this._userName = o["bookName"];
    this._likeCount = o["likeCount"];
    this._comment = o["comment"];
  }*/
}
