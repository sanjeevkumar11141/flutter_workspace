import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigation_udemy_course_example/one_page_details.dart';

class OnePage extends StatelessWidget {
  static const String routeName = 'one';
  const OnePage({super.key});

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
            ElevatedButton(
              onPressed: () {
              //  context.go('/one/one_details');
                context.goNamed(OnePageDetails.routeName);
              },
              child: Text('One Page Details'),
            ),
          ],
        ),
      ),
    );
  }
}
