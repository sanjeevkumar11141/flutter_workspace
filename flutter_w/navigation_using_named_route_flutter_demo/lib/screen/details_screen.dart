import 'package:flutter/material.dart';
import 'package:navigation_using_named_route_flutter_demo/navigation/navigation_service.dart';
import 'package:navigation_using_named_route_flutter_demo/navigation/routes_name.dart';

import '../model/student.dart';

class DetailsScreen extends StatelessWidget {
   DetailsScreen({super.key});

  final NavigationService _navigationService = NavigationService();

  @override
  Widget build(BuildContext context) {
    //final String data = ModalRoute.of(context)!.settings.arguments as String;
    final Student student = ModalRoute.of(context)!.settings.arguments as Student;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade300,
        title: Text('Details Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Student Details : ${student.name}'),
            Text(student.address),
            Text(student.course),
            Text(student.id.toString()),
            ElevatedButton(
              onPressed: () {
               // _navigationService.goBack();
                _navigationService.navigateTo(RoutesName.profile);
              },
              child: Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
