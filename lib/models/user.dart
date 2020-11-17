class User {

  String _eMail;
  String _userName;
  String _name;
  String _password;
  //String _createdDate;

  User(this._eMail, this._userName, this._name, this._password,);

  
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["eMail"] = _eMail;
    map["userName"] = _userName;
    map["name"] = _name;
    map["password"] = _password;
    return map;
  }

  User.fromObject(dynamic o) {

    this._eMail = o["eMail"];
    this._userName = o["userName"];
    this._name = o["name"];
    this._password = o["password"];
  }
}
