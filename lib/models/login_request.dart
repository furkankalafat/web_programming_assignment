class LoginRequest {

  String userName;
  String password;

  LoginRequest(this.userName, this.password);

  
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["userName"] = userName;
    map["password"] = password;
    return map;
  }

  LoginRequest.fromObject(dynamic o) {
    this.userName = o["userName"];
    this.password = o["password"];
  }
}
