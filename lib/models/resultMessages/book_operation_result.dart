import 'package:login_check_app/models/resultMessages/result_message.dart';

class BookOperationResult extends ResultMessage {
  String message;

  BookOperationResult(this.message);

  void setMessage(String current) {
    this.message = current;
  }

  String getMessage() {
    return this.message;
  }

  BookOperationResult.fromObject(dynamic o) {
    this.isSuccess = o["isSuccess"];
    this.message = o["message"];
  }
}
