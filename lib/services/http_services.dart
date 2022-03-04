import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:mowasla/models/user.dart';

class HttpServices {
  String uri = "http://192.168.1.37:3232/api/";
  User user = User();
  Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8'
  };

  Future<http.Response> get(String url) {
    inspect(headers);
    return http.get(
      Uri.parse(uri + url),
      headers: headers,
    );
  }

  Future<http.Response> post(String url, dynamic data) {
    return http.post(Uri.parse(uri + url),
        headers: headers, body: jsonEncode(data));
  }
}
 
// Future<http.Response> fetchUser() {  //baro7 3la el "link" api eli mab3otli
//   return http.get(Uri.parse('http://192.168.1.37:3232/api/login'));
//   }

//   Future<User> convertResponseToJSON() async {   // ba7wel el api response le json 3an tare2 el user model function
//   final response = await http.get(Uri.parse('http://192.168.1.37:3232/api/login'));

//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     return User.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load user');
//   }
// }