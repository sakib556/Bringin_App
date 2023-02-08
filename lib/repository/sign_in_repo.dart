import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bringin_app/constants/api_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInRepo {
  SignInRepo._();

  static Future<void> sendOTP(String phoneNumber) async {
    try {
      final response = await http.post(
        Uri.parse(sendOtpUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          "phone": phoneNumber, //without +88
          "role": "seekers" //seekers or recruiters
        }),
      );

      if (response.statusCode == 200) {
        print(response.body);
      } else {
        print(response.body);
      }
    } catch (error) {
      print(error.toString());
    }
  }



  static Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

  static Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') ?? '';
  }
}
