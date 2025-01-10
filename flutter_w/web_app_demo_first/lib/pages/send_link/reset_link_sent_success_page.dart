import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_app_demo_first/main.dart';

class ResetLinkSentSuccessPage extends StatelessWidget {
  const ResetLinkSentSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                width: constraints.maxWidth * 0.9,
                // Adjust width for responsiveness
                height: MediaQuery.of(context).size.height,
                // Full height of the screen
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Left Side with Form and Content
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildConfirmationSection(context),
                            _buildFooterLinks(),
                          ],
                        ),
                      ),
                    ),
                    // Right Side (Black Background)
                    if (constraints.maxWidth > 600)
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          color: Colors.black,
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  // Reusable widget for the confirmation section
  Widget _buildConfirmationSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 40.0),
          child: Text(
            'devrio',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        const Text(
          'Link sent',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Check your email and use the reset link to create a new password. Don’t forget about the spam folder.',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 20),
        GestureDetector(
          onTap: () {
            context.go('/update_password_page');
          },
          child: Text(
            "Didn't get an email?",
            style: TextStyle(
              color: Colors.blue,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }

  // Reusable widget for the footer links
  Widget _buildFooterLinks() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                // Handle back to login action
              },
              child: const Text(
                'Back to Login',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                // Handle resource center action
              },
              child: const Text(
                'Resource Center',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
            ),
          ),
          const Expanded(
            child: Text(
              '+1 (508) 212-6880',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
