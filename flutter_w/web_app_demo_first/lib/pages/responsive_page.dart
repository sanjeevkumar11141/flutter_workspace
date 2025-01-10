import 'package:flutter/material.dart';
import 'package:web_app_demo_first/shared/reusable_text_field.dart';


class ResponsivePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: LayoutBuilder(
            builder: (context, constraints) {
              // Adjust layout based on screen width
              if (constraints.maxWidth > 600) {
                // Wide screen: Use Row layout
                return Container(
                  padding: EdgeInsets.all(32.0),
                  width: constraints.maxWidth * 0.8,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Left Side with Title and Description
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 40.0),
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
                                  height: 1,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'You\'ll have full admin access and will be able to add more users later.',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Right Side with Form Fields
                      Expanded(
                        flex: 1,
                        child: _buildForm(context),
                      ),
                    ],
                  ),
                );
              } else {
                // Narrow screen: Use Column layout
                return Container(
                  padding: EdgeInsets.all(16.0),
                  width: constraints.maxWidth * 0.9,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Title and Description at the top
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Make yourself\nthe first user',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              height: 1,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'You\'ll have full admin access and will be able to add more users later.',
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      // Form below the title
                      _buildForm(context),
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
      bottomNavigationBar: const BottomAppBar(
        color: Colors.black,
        height: 70,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Align(
            alignment: Alignment.topCenter,
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
                      decorationThickness: 1.5,
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
                      decorationThickness: 1.5,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ),
      ),
    );
  }

  // Extracted method for building the form fields
  Widget _buildForm(BuildContext context) {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
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
          ReusableTextFormField(labelText: '(123) 456-7890*'),
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
              contentPadding:
                  EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
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
          ReusableTextFormField(
              labelText: 'Create Strong Password*', obscureText: true),
          SizedBox(height: 16),
          ReusableTextFormField(
              labelText: 'Confirm Strong Password*', obscureText: true),
          SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.grey.shade100,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text(
                    'Back',
                    style: TextStyle(color: Colors.black),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text(
                    'Next',
                    style: TextStyle(color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
