import 'package:login_check_app/models/resultMessages/result_message.dart';

class LoginResult extends ResultMessage{

  String message;

  void setMessage(String current){
    this.message = current;
  }

  String getMessage(){
    return this.message;
  }

  LoginResult.fromObject(dynamic o) {
    this.isSuccess = o["isSuccess"];
    this.message = o["message"];
  }
}