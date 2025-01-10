import 'package:flutter/material.dart';
import 'package:navigation_using_named_route_flutter_demo/navigation/navigation_service.dart';
import 'package:navigation_using_named_route_flutter_demo/navigation/routes_name.dart';

import '../model/student.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});
  final NavigationService _navigationService = NavigationService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade300,
        title: Text('HomeScreen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            Student student = Student(name: 'John Doe', address: '123 Elm St', course: 'Biology', id: 1);
            _navigationService.navigateTo(RoutesName.details, arguments: student);

            /*Navigator.pushNamed(
              context,
              RoutesName.details,
              arguments: 'Data from Home Screen',
            );*/
          },
          child: Text('Details Screen'),
        ),
      ),
    );
  }
}
