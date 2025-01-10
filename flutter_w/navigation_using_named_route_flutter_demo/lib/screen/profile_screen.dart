import 'package:flutter/material.dart';
import 'package:navigation_using_named_route_flutter_demo/navigation/navigation_service.dart';
import 'package:navigation_using_named_route_flutter_demo/navigation/routes_name.dart';

class ProfileScreen extends StatelessWidget {
   ProfileScreen({super.key});
  final NavigationService _navigationService = NavigationService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade300,
        title: Text('Profile Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            Navigator.pushNamedAndRemoveUntil(context, RoutesName.home, (Route<dynamic> route) => false);
          },
          child: Text('Home Screen'),
        ),
      ),
    );
  }
}
