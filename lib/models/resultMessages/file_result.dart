import 'package:login_check_app/models/resultMessages/result_message.dart';

class FileResult extends ResultMessage{
  FileResult.fromObject(dynamic o) {
    this.isSuccess = o["isSuccess"];
  }
}