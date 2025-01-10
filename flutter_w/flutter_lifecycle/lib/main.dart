import 'package:flutter/material.dart';
import 'package:flutter_lifecycle/did_change_dependencies/my_home_page.dart';
import 'package:flutter_lifecycle/expended_widget_test.dart';

import 'did_update_widget/parent_widget.dart';
import 'test_widget_lifecycle.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
     // home: const TestWidgetLifecycle(),
     // home:  MyHomePage(),
     // home:  ParentWidget(),
      home:  ExpendedWidgetTest(),
    );
  }
}


