import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigation_udemy_course_example/two_page.dart';

class OnePageDetails extends StatelessWidget {
  static const String routeName = 'one_details';
  const OnePageDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OnePageDetails'),
      ),
      body:  Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
              //  context.go('/one/one_details/two');
                context.goNamed('two_from_one_details');
              },
              child: Text('Two Page'),
            ),
          ],
        ),
      ),
    );
  }
}
