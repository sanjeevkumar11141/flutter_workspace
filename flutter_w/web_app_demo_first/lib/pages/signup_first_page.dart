import 'package:flutter/material.dart';
import 'package:web_app_demo_first/shared/reusable_text_field.dart';



class SignupFirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView( // Wrap the entire content in SingleChildScrollView
          child: Container(
            padding: EdgeInsets.all(32.0),
            width: MediaQuery.of(context).size.width * 0.8, // Responsive width
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Left Side with Title and Description
                const Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.only(right: 40.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Make yourself\nthe first user',
                          style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            height: 1, // Adjust this value to decrease the line height
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'You\'ll have full admin access and will be able to add more users later.',
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
                // Right Side with Form Fields
                Expanded(
                  flex: 1,
                  child: Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Expanded(
                              child: ReusableTextFormField(labelText: 'First Name*'),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: ReusableTextFormField(labelText: 'Last Name*'),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        const ReusableTextFormField(labelText: '(123) 456-7890*'),
                        SizedBox(height: 16),
                        ReusableTextFormField(labelText: 'Email Address*'),
                        SizedBox(height: 16),
                        ReusableTextFormField(labelText: 'Job Title*'),
                        SizedBox(height: 16),
                        DropdownButtonFormField<String>(
                          value: 'Admin',
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                          items: ['Admin', 'User'].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {},
                        ),
                        SizedBox(height: 16),
                        ReusableTextFormField(labelText: 'Create Strong Password*', obscureText: true),
                        SizedBox(height: 16),
                        ReusableTextFormField(labelText: 'Confirm Strong Password*', obscureText: true),
                        SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.black, // Text color
                                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              child: Text('Back'),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black, // Button color
                                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              child: Text('Next'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomAppBar(
        color: Colors.black,
        height: 70,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Align(
            alignment: Alignment.topCenter, // Align the text to the right
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'By creating an account, you agree to the ',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  TextSpan(
                    text: 'Terms of Service',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.white,
                      decorationThickness: 1.5, // Adjust thickness if needed
                    ),
                  ),
                  TextSpan(
                    text: ' & ',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  TextSpan(
                    text: 'Privacy Policy.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.white,
                      decorationThickness: 1.5, // Adjust thickness if needed
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.right, // Text alignment to the right
            ),
          ),
        ),
      ),
    );
  }
}
