import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DemoSvgScreen extends StatelessWidget {
  const DemoSvgScreen({super.key});

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
      
            // Your widgets on top of the background
            Align(
              alignment: Alignment.topCenter, // Adjust alignment as needed
              child: Padding(
                padding: EdgeInsets.all(20.0), // Add padding for spacing
                child: Text(
                  'Login Screen',
                  style: TextStyle(
                    color: Colors.white, // Adjust text color for visibility
                    fontSize: 24.0,
                  ),
                ),
              ),
            ),
            // Other widgets can be added here
          ],
        ),
      ),
    );
  }
}
