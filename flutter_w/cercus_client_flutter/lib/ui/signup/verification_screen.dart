import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../constants/number_constants.dart';
import '../../constants/string_constants.dart';


class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/bg.png',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: NumberConstants.value_24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/images/group_2.png'),
                  const SizedBox(height: NumberConstants.value_20),
                  const Text(
                    StringConstants.verificationEmailSent,
                    style: TextStyle(
                      fontSize: NumberConstants.value_24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: NumberConstants.value_10),
                  const Text(
                    StringConstants.emailLinkSent,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: NumberConstants.value_16,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: NumberConstants.value_40),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to the sign-in screen
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFC107),
                      padding: const EdgeInsets.symmetric(horizontal: NumberConstants.value_50, vertical: NumberConstants.value_15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(NumberConstants.value_30),
                      ),
                    ),
                    child: const Text(
                      StringConstants.signIn,
                      style: TextStyle(
                        fontSize: NumberConstants.value_18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: NumberConstants.value_20),
                  RichText(
                    text: TextSpan(
                      text: StringConstants.didntGetLink,
                      style: const TextStyle(
                        fontSize: NumberConstants.value_16,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: StringConstants.resend,
                          style: const TextStyle(
                            fontSize: NumberConstants.value_16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Resend the verification email
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
