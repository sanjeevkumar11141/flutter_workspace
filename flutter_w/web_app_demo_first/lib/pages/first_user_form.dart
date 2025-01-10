import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:web_app_demo_first/shared/reusable_form_builder_text_field.dart';

class FirstUserForm extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();

  FirstUserForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(32.0),
          width: MediaQuery.of(context).size.width * 0.8,
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
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          height: 0.9,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'You\'ll have full admin access and will be able to add more users later.',
                        style: TextStyle(fontSize: 20, color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ),
              // Right Side with Form Fields
              Expanded(
                flex: 1,
                child: SingleChildScrollView(
                  child: FormBuilder(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Expanded(
                              child: ReusableFormBuilderTextField(
                                name: 'first_name',
                                labelText: 'First Name*',
                              ),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: ReusableFormBuilderTextField(
                                name: 'last_name',
                                labelText: 'Last Name*',
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        const ReusableFormBuilderTextField(
                          name: 'phone',
                          labelText: '(123) 456-7890*',
                          keyboardType: TextInputType.phone,
                        ),
                        SizedBox(height: 16),
                        const ReusableFormBuilderTextField(
                          name: 'email',
                          labelText: 'Email Address*',
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 16),
                        const ReusableFormBuilderTextField(
                          name: 'job_title',
                          labelText: 'Job Title*',
                        ),
                        SizedBox(height: 16),
                        FormBuilderDropdown<String>(
                          name: 'role',
                          decoration: _inputDecoration('Role*'),
                          initialValue: 'Admin',
                          items: ['Admin', 'User']
                              .map((role) => DropdownMenuItem(
                                    value: role,
                                    child: Text(role),
                                  ))
                              .toList(),
                        ),
                        SizedBox(height: 16),
                        const ReusableFormBuilderTextField(
                          name: 'password',
                          labelText: 'Create Strong Password*',
                          obscureText: true,
                        ),
                        SizedBox(height: 16),
                        const ReusableFormBuilderTextField(
                          name: 'confirm_password',
                          labelText: 'Confirm Strong Password*',
                          obscureText: true,
                        ),
                        SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                // Handle back action
                              },
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.black,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 20),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              child: Text('Back'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.saveAndValidate()) {
                                  // Handle form submission
                                  print(_formKey.currentState!.value);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 20),
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
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomAppBar(
        color: Colors.black,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Align(
            alignment: Alignment.centerRight,
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

  InputDecoration _inputDecoration(String labelText) {
    return InputDecoration(
      labelText: labelText,
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
    );
  }
}
