import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_app_demo_first/shared/reusable_text_field.dart';

class UpdatePasswordPage extends StatelessWidget {
  const UpdatePasswordPage({super.key});

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
                            _buildUpdatePasswordSection(context),
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

  // Reusable widget for the update password section
  Widget _buildUpdatePasswordSection(BuildContext context) {
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
          'Update password',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 20),
        ReusableTextFormField(
          labelText: 'Enter Password',
          obscureText: true,
          suffixIcon: IconButton(
            icon: const Icon(Icons.visibility),
            onPressed: () {
              // Toggle password visibility
            },
          ),
        ),
        const SizedBox(height: 16),
        const ReusableTextFormField(
          labelText: 'Confirm Password',
          obscureText: true,
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            // Handle password requirements action
          },
          child: const Text(
            'What are the requirements?',
            style: TextStyle(
              color: Colors.blue,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // Handle create action
            context.go('/password_update_success_page');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          child: const Center(
            child: Text(
              'Create',
              style: TextStyle(color: Colors.white),
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
