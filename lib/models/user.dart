class User {

  String _eMail;
  String _userName;
  String _name;
  String _password;
  //String _createdDate;

  User(this._eMail, this._userName, this._name, this._password,);//this._createdDate

  String get eMail => _eMail;
  // ignore: unnecessary_getters_setters
  String get userName => _userName;
  String get name => _name;
  // ignore: unnecessary_getters_setters
  String get password => _password;

  set eMail(String newEMail) {
    _eMail = newEMail;
  }

  set userName(String newUserName) {
    _userName = newUserName;
  }

  set name(String newName){
    _name = newName;
  }

 set password(String newPassword) {
    _password = newPassword;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["eMail"] = _eMail;
    map["userName"] = _userName;
    map["name"] = _name;
    map["password"] = _password;
    //map["createdDate"] = _createdDate;
    return map;
  }

  User.fromObject(dynamic o) {

    this._eMail = o["eMail"];
    this._userName = o["userName"];
    this._name = o["name"];
    this._password = o["password"];
    //this._createdDate = o["createdDate"];
  }
}
