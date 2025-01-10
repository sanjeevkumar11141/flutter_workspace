import 'package:cercus_client_flutter/ui/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../login/sign_in_screen.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    // Navigate to HomeScreen after a delay
    Future.delayed(const Duration(seconds: 5), () {
      /*Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  LoginScreen()),
      );*/
    //  context.pushReplacementNamed('login');
      context.pushReplacementNamed('profile_completion_screen');
     // context.pushReplacementNamed('image_picker_demo');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/images/bg.png',
            fit: BoxFit.cover,
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Positioned.fill(
                child: Image.asset(
                  'assets/images/cercuslogo_dark.png',
                  fit: BoxFit.cover,
                  width: 158,
                  height: 85,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'The Global Tattoo Marketplace',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
