import 'book.dart';

class CompositeBookComment {

  Book book;
  String newComment;

  CompositeBookComment(this.book, this.newComment);

  
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["book"] = book;
    map["newComment"] = newComment;
    return map;
  }

  CompositeBookComment.fromObject(dynamic o) {
    this.book = o["book"];
    this.newComment = o["newComment"];
  }
}
