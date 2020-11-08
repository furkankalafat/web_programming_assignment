class Users {
  int _id;
  String _firstName;
  String _lastName;

  Users(this._firstName, this._lastName);
  Users.WithId(this._id, this._firstName, this._lastName);

  int get id => _id;
  String get firstName => _firstName;
  String get lastName => _lastName;

  set firstName(String newFirstName) {
    _firstName = newFirstName;
  }

  set lastName(String newLastName) {
    _lastName = newLastName;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["firstName"] = _firstName;
    map["lastName"] = _lastName;

    if (_id != null) {
      map["id"] = _id;
    }
    return map;
  }

  Users.fromObject(dynamic o) {
    this._id = o["id"];
    this._firstName = o["firstName"];
    this._lastName = o["lastName"];
  }
}
