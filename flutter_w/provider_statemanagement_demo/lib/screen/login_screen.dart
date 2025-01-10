import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_statemanagement_demo/constants/string_constants.dart';
import 'package:provider_statemanagement_demo/provider/auth_provider.dart';

import '../../constants/number_constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late AuthProvider authProvider;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _obscurePassword = true;
  String? _emailErrorText;
  String? _passwordErrorText;

  @override
  void initState() {
    super.initState();

    _emailController.addListener(() {
      setState(() {
        _emailErrorText = null;
      });
    });

    _passwordController.addListener(() {
      setState(() {
        _passwordErrorText = null;
      });
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    authProvider = Provider.of<AuthProvider>(context);
  }

  void _validateEmail(String value) {
    if (value.isEmpty) {
      setState(() {
        _emailErrorText = StringConstants.emailIsRequired;
      });
    } else if (!isEmailValid(value)) {
      setState(() {
        _emailErrorText = StringConstants.enterValidEmail;
      });
    } else {
      setState(() {
        _emailErrorText = null;
      });
    }
  }

  bool isEmailValid(String email) {
    // Basic email validation using regex
    return RegExp(r'^[\w-\.]+@[a-zA-Z]+\.[a-zA-Z]{2,}$').hasMatch(email);
  }

  void _submitForm() {
    setState(() {
      _validateEmail(_emailController.text);
      if (_passwordController.text.isEmpty) {
        _passwordErrorText = StringConstants.passwordIsRequired;
      } else {
        _passwordErrorText = null;
      }
    });

    if (_formKey.currentState!.validate()) {
      // Form is valid, proceed with your logic here
      // print('Email: ${_emailController.text}');
      // print('Password: ${_passwordController.text}');

      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(
      //     content: Text('Go For api Calling ', style: TextStyle(color: Colors.black)),
      //     backgroundColor: Color(0xFFFFC107),
      //   ),
      // );

      authProvider.login(_emailController.text, _passwordController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            // Background SVG image
            Positioned.fill(
              child: Image.asset(
                'assets/images/bg.png',
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: NumberConstants.value_30),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/cercuslogo_dark.png',
                          width: 158,
                          height: 85,
                        ), // Add your logo asset
                        SizedBox(height: NumberConstants.value_50),
                        _buildEmailField(),
                        SizedBox(height: NumberConstants.value_20),
                        _buildPasswordField(),
                        SizedBox(height: NumberConstants.value_30),
                        ElevatedButton(
                            onPressed: _submitForm,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFFFC107),
                              // Yellow color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    NumberConstants.value_30),
                              ),
                              minimumSize: Size(
                                  double.infinity,
                                  NumberConstants
                                      .value_50), // Full width button
                            ),
                            child: Center(
                              child: authProvider.loading
                                  ? CircularProgressIndicator(
                                      color: Colors.green)
                                  : const Text(
                                      StringConstants.signIn,
                                      style: TextStyle(
                                        fontSize: NumberConstants.value_18,
                                        color: Colors.black,
                                      ),
                                    ),
                            )),
                        SizedBox(height: NumberConstants.value_20),
                        InkWell(
                          onTap: () {
                            // context.pushNamed('forget_password_screen');
                          },
                          child: const Text(
                            StringConstants.forgotPassword,
                            style: TextStyle(
                              color: Colors.black,
                              decoration: TextDecoration
                                  .underline, // Optional: Add underline to indicate it's clickable
                            ),
                          ),
                        ),
                        SizedBox(height: 100),
                        Padding(
                          padding:
                              EdgeInsets.only(bottom: NumberConstants.value_20),
                          child: InkWell(
                            onTap: () {
                              //  context.pushNamed('account_type_selection_screen');
                            },
                            child: const Text(
                              StringConstants.newToCerCusSignUp,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmailField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          StringConstants.emailAddress,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: NumberConstants.value_5),
        TextFormField(
          controller: _emailController,
          validator: (value) => _emailErrorText,
          onChanged: _validateEmail,
          decoration: InputDecoration(
            hintText: 'melvingarner@gmail.com',
            filled: true,
            fillColor: Color(0xFFebe6d9),
            // Light grey color
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(NumberConstants.value_30),
              borderSide: BorderSide.none,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(NumberConstants.value_30),
              borderSide: const BorderSide(
                color: Colors.red,
                width: NumberConstants.value_1,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(NumberConstants.value_30),
              borderSide: const BorderSide(
                color: Colors.red,
                width: NumberConstants.value_1,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          StringConstants.password,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: NumberConstants.value_5),
        TextFormField(
          controller: _passwordController,
          obscureText: _obscurePassword,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return StringConstants.passwordIsRequired;
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: '********',
            filled: true,
            fillColor: Color(0xFFebe6d9),
            // Light grey color
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(NumberConstants.value_30),
              borderSide: BorderSide.none,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(NumberConstants.value_30),
              borderSide: BorderSide(
                color: Colors.red,
                width: NumberConstants.value_1,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(NumberConstants.value_30),
              borderSide: BorderSide(
                color: Colors.red,
                width: NumberConstants.value_1,
              ),
            ),
            suffixIcon: IconButton(
              icon: Icon(
                _obscurePassword ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
