import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:login_check_app/models/user.dart';

class APIservices {
  static String userUrl = "http://192.168.1.246:5001/api/values";
  static String createUserUrl = "http://192.168.1.246:5001/user/create";

  static Future fetchUser() async {
    debugPrint("Fetch USER");
    return await http.get(userUrl, headers: {
  "Access-Control-Allow-Origin": "*", // Required for CORS support to work
  "Access-Control-Allow-Credentials": "true", // Required for cookies, authorization headers with HTTPS
  "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token",
  "Access-Control-Allow-Methods": "GET, POST, OPTIONS, PUT, PATCH, DELETE"});
  }

  static Future  createUser() async{
    User user = new User("enesbayar03@gmail.com","enesbayarr","enes","asde");
    
    await http.post(
      createUserUrl, body: user.toMap() );
  }
  
}
