class LoginRequest {

  String _userName;
  String _password;

  LoginRequest(this._userName, this._password);

  
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["userName"] = _userName;
    map["password"] = _password;
    return map;
  }

  LoginRequest.fromObject(dynamic o) {
    this._userName = o["userName"];
    this._password = o["password"];
  }
}
