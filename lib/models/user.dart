class User {
  String eMail;
  String userName;
  String name;
  String password;
  String likesBookList;
  String readBookList;
  DateTime createdDate;
  User({
    this.eMail,
    this.userName,
    this.name,
    this.password,
    this.likesBookList,
    this.readBookList,
  });
/*
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["eMail"] = _eMail;
    map["userName"] = _userName;
    map["name"] = _name;
    map["password"] = _password;
    map["likesBookList"] = _likesBookList;
    map["readBookList"] = _readBookList;

    return map;
  }
*/
  Map<String, dynamic> toJson() => {
        "eMail": eMail,
        "userName": userName,
        "name": name,
        "password" : password,
        "likesBookList" : likesBookList,
        "readBookList" : readBookList
      };

  User.fromObject(dynamic o) {
    this.eMail = o["eMail"];
    this.userName = o["userName"];
    this.name = o["name"];
    this.password = o["password"];
    this.likesBookList = o["likesBookList"];
    this.readBookList = o["readBookList"];
    this.createdDate = o["CreatedDate"];
  }
}
