import 'package:http/http.dart' as http;

class APIservices {
  static String userUrl = "";

  static Future fetchUser() async {
    return await http.get(userUrl);
  }
}
