import 'package:flutter/material.dart';

import 'counter_widget.dart';

class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  int _initialCount = 0;

  void _updateInitialCount() {
    setState(() {
      _initialCount += 5; // Increment the initial count by 5
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parent Widget'),
      ),
      body: Center(
        child: CounterWidget(initialCount: _initialCount),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _updateInitialCount,
        child: Icon(Icons.add),
      ),
    );
  }
}
