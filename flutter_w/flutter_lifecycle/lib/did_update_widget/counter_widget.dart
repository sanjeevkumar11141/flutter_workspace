import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  final int initialCount;

  CounterWidget({Key? key, required this.initialCount}) : super(key: key);

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  late int _count;

  @override
  void initState() {
    super.initState();
    // Initialize _count with initialCount from the parent
    print("CounterWidget : initState");
    _count = widget.initialCount;
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("CounterWidget : didChangeDependencies");
  }

  @override
  void didUpdateWidget(CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("CounterWidget : didUpdateWidget");
    // Check if the initialCount has changed
    if (widget.initialCount != oldWidget.initialCount) {
      // Update the _count if initialCount from the parent widget has changed
      _count = widget.initialCount;
    }
  }

  void _incrementCounter() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("CounterWidget : build");
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Count: $_count'),
        ElevatedButton(
          onPressed: _incrementCounter,
          child: Text('Increment'),
        ),
      ],
    );
  }
}
