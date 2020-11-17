import 'package:login_check_app/models/resultMessages/result_message.dart';

class UserOperationResult extends ResultMessage{

  String createdDate;
  String message;

  UserOperationResult(this.createdDate, this.message);

  void setCreatedDate(String current){
    this.createdDate = current;
  }

  String getCreatedDate(){
    return this.createdDate;
  }

  void setMessage(String current){
    this.message = current;
  }

  String getMessage(){
    return this.message;
  }

  UserOperationResult.fromObject(dynamic o) {
    this.isSuccess = o["isSuccess"];
    this.createdDate = o["createdDate"];
    this.message = o["message"];
  }
}