import 'book.dart';
import 'user.dart';

class CompositeObject {

  Book book;
  User user;

  CompositeObject(this.book, this.user);

  
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["book"] = book;
    map["user"] = user;
    return map;
  }

  CompositeObject.fromObject(dynamic o) {
    this.book = o["book"];
    this.user = o["user"];
  }
}
