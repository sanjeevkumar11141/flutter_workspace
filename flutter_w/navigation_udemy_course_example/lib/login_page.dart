import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  static const String routeName = 'login';
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body:  Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Login Here",style: Theme.of(context).textTheme.headlineLarge,)
          ],
        ),
      ),
    );
  }
}
