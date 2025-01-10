import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_app_demo_first/shared/reusable_text_field.dart';



class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                width: constraints.maxWidth * 0.9, // Adjust width for responsiveness
                height: MediaQuery.of(context).size.height, // Full height of the screen
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Left Side with Form and Content
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center, // Center align the children
                          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between to push footer to bottom
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // Logo
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 40.0),
                                  child: Text(
                                    'devrio',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                // Centered Title
                                Center(
                                  child: Text(
                                    'Sign in to Devrio',
                                    style: TextStyle(
                                      fontSize: 36,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                SizedBox(height: 40),
                                // Form Fields
                                _buildLoginForm(context),
                              ],
                            ),
                            // Footer Links at the bottom
                            _buildFooterLinks(context),
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

  // Reusable widget for the login form
  Widget _buildLoginForm(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReusableTextFormField(
            labelText: 'Email Address',
            obscureText: false,
          ),
          SizedBox(height: 16),
          ReusableTextFormField(
            labelText: 'Password',
            obscureText: true,
            suffixIcon: IconButton(
              icon: Icon(Icons.visibility),
              onPressed: () {
                // Toggle password visibility
              },
            ),
          ),
          SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              context.go('/send_link_page');
            },
            child: Text(
              'Forgot password?',
              style: TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Handle login action
              context.go('/home_page');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              padding: EdgeInsets.symmetric(vertical: 16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: Center(
              child: Text(
                'Continue',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Reusable widget for the footer links
  Widget _buildFooterLinks(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0), // Add some spacing from the content above
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                context.go('/signup');
              },
              child: Text(
                'Create Account',
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
              child: Text(
                'Resource Center',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
            ),
          ),
          Expanded(
            child: Text(
              '+1 (508) 212-6880',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
