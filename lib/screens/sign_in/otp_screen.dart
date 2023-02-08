import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

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
                // Validate and submit the OTP
              },
            ),
          ],
        ),
      ),
    );
  }
}
