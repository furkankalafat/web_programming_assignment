import 'package:http/http.dart' as http;

class APIservices {
  static String userUrl = "http://localhost:8080/";

  static Future fetchUser() async {
    return await http.get(userUrl);
  }
}
