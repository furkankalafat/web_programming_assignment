import 'package:login_check_app/models/resultMessages/result_message.dart';

class BookOperationResult extends ResultMessage {
  String book;

  BookOperationResult(this.book);

  void setMessage(String current) {
    this.book = current;
  }

  String getMessage() {
    return this.book;
  }

  BookOperationResult.fromObject(dynamic o) {
    this.isSuccess = o["isSuccess"];
    this.book = o["message"];
  }
}
