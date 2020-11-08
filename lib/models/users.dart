class Users {
  int _id;
  String _firstName;
  String _lastName;
  String _userName;
  String _password;

  Users(this._firstName, this._lastName, this._userName, this._password);
  Users.WithId(this._id, this._firstName, this._lastName, this._userName,
      this._password);

  int get id => _id;
  String get firstName => _firstName;
  String get lastName => _lastName;
  String get userName => _userName;
  String get password => _password;

  set firstName(String newFirstName) {
    _firstName = newFirstName;
  }

  set lastName(String newLastName) {
    _lastName = newLastName;
  }

  set userName(String newUserName) {
    _userName = newUserName;
  }

  set password(String newPassword) {
    _password = newPassword;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["firstName"] = _firstName;
    map["lastName"] = _lastName;
    map["userName"] = _userName;
    map["password"] = _password;

    if (_id != null) {
      map["id"] = _id;
    }
    return map;
  }

  Users.fromObject(dynamic o) {
    this._id = o["id"];
    this._firstName = o["firstName"];
    this._lastName = o["lastName"];
    this._userName = o["userName"];
    this._password = o["password"];
  }
}
