import 'package:flutter/material.dart';

class TwoPage extends StatelessWidget {
  static const String routeName = 'two';
  final String msg;
  const TwoPage({super.key, required this.msg});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TwoPage'),
      ),
      body:  Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(msg,style: Theme.of(context).textTheme.headlineLarge,)
          ],
        ),
      ),
    );
  }
}
