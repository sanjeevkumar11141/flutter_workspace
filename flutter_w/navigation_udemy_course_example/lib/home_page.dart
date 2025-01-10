import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigation_udemy_course_example/one_page.dart';
import 'package:navigation_udemy_course_example/profile_page.dart';
import 'package:navigation_udemy_course_example/two_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
              //  context.go('/one'); // go methods are using when we are using path variable of GoRoute for navigation this is very error prone.
                context.goNamed(OnePage.routeName);
              },
              child: Text('One Page'),
            ),
            ElevatedButton(
              onPressed: () {
              //  context.go('/two');
                context.goNamed("two_from_home",extra: "Hello Flutter what's up");
              },
              child: Text('Two Page'),
            ),
            ElevatedButton(
              onPressed: () {
                context.goNamed(ProfilePage.routeName,pathParameters: {'profileId' : '1'});
              },
              child: Text('Profile Page'),
            )
          ],
        ),
      ),
    );
  }
}
