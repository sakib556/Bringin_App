import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bringin_app/constants/api_constant.dart';

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

     static Future<String> getToken(String phone, String otp) async {
  final response = await http.post(
    Uri.parse(getTokenUrl),
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode({
      'phone': phone,
      'OTP': otp,
    }),
  );

  if (response.statusCode == 200) {
    final responseJson = jsonDecode(response.body);
    if (responseJson['message'] == 'Success !') {
      return responseJson['data']['token'];
    } else {
      throw Exception('Failed to get token');
    }
  } else {
    throw Exception('Failed to get token');
  }
}




}
