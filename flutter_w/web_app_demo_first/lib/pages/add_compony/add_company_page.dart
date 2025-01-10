import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_app_demo_first/shared/reusable_text_field.dart';



class AddCompanyPage extends StatelessWidget {
  const AddCompanyPage({super.key});

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
                    children: [
                      // Left Side with Title and Description
                      const Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.only(right: 30.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "First, let's add\nyour company",
                                style: TextStyle(
                                  fontSize: 60,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  height: 1,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Add your company, and then later you\'ll be able to add individual users.',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
                                ),
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
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "First, let's add\nyour company",
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              height: 1,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Add your company, and then later you\'ll be able to add individual users.',
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
          ReusableTextFormField(labelText: 'Company Name*'),
          SizedBox(height: 16),
          const Row(
            children: [
              Expanded(
                child: ReusableTextFormField(labelText: '(123) 456-7890*'),
              ),
              SizedBox(width: 16),
              Expanded(
                child: ReusableTextFormField(labelText: 'Company Email*'),
              ),
            ],
          ),
          SizedBox(height: 16),
          ReusableTextFormField(
              labelText: '123 Main Street, Boston, MA, 01234*'),
          SizedBox(height: 16),
          ReusableTextFormField(labelText: 'Website*'),
          SizedBox(height: 16),
          _buildLogoUploadSection(),
          SizedBox(height: 16),
          ReusableTextFormField(labelText: 'How did you hear about Devrio?*'),
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
                  onPressed: () {
                    context.go('/');
                  },
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

  // Reusable widget for the logo upload section
  Widget _buildLogoUploadSection() {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black), // Border with black color
        borderRadius: BorderRadius.circular(10), // Rounded corners
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Text(
                  'YOUR ',
                  style: TextStyle(
                      height: 1,
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'LOGO',
                  style: TextStyle(
                      height: 1,
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  'HERE',
                  style: TextStyle(
                      height: 1,
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                ),
              ]),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  // Handle upload logic
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade200,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text(
                  'Upload',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
