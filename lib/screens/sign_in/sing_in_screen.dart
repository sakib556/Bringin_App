import 'package:bringin_app/repository/sign_in_repo.dart';
import 'package:bringin_app/screens/sign_in/otp_screen.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _phoneNumberController = TextEditingController();
  String title1 = "Sign In / Sign Up ",
      title2 = "Job Seeker",
      title3 = "If you already have account you will be log in to your profile."
          "Otherwise you will be given the option to set a new profile.";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(title1),
            Text(title2),
            Text(title3),
            TextField(
              controller: _phoneNumberController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                hintText: 'Phone Number',
                labelText: 'Phone Number',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                await SignInRepo.sendOTP(_phoneNumberController.text)
                    .whenComplete(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OtpScreen(),
                    ),
                  );
                });
              },
              child: const Text('Send Code'),
            ),
          ],
        ),
      ),
    );
  }
}
