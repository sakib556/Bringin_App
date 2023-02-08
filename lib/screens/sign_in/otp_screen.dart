import 'package:bringin_app/repository/local_storage.dart';
import 'package:bringin_app/repository/sign_in_repo.dart';
import 'package:bringin_app/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key, required this.mobileNumber});
  final String mobileNumber;
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String _otp = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            PinCodeTextField(
              length: 4,
              obscureText: false,
              animationType: AnimationType.fade,
              animationDuration: const Duration(milliseconds: 300),
              onChanged: (value) {
                setState(() {
                  _otp = value;
                });
              },
              appContext: context,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: const Text('Submit'),
              onPressed: () {
                SignInRepo.getToken("01857447556", _otp).then((value) async {
                  await LocalStorage.saveToken(value)
                      .whenComplete(() => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                          ));
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
