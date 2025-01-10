import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigation_udemy_course_example/one_page_details.dart';

class ProfilePage extends StatelessWidget {
  static const String routeName = 'profile_page';
  final int profileId;
  const ProfilePage({super.key, required this.profileId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OnePage'),
      ),
      body:  Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('$profileId',style: Theme.of(context).textTheme.headlineLarge,)
          ],
        ),
      ),
    );
  }
}
