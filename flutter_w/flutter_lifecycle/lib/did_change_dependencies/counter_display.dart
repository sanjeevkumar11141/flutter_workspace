import 'package:flutter/material.dart';

import 'counter_inherited_widget.dart';

class CounterDisplay extends StatefulWidget {
  @override
  State<CounterDisplay> createState() => _CounterDisplayState();
}

class _CounterDisplayState extends State<CounterDisplay> {
  int _inheritedData = 0;
  @override
  void initState() {
    super.initState();
    print('Sk initState CounterDisplay : initState.');
    final theme = Theme.of(context);
  }

  @override
  void didChangeDependencies() {
    print('Sk didChangeDependencies CounterDisplay : Dependencies have changed.');
    super.didChangeDependencies();
    // Access the inherited widget data
    final inheritedWidget = CounterInheritedWidget.of(context);
    if (inheritedWidget != null) {
      setState(() {
        _inheritedData = inheritedWidget.counter;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print('Sk build CounterDisplay : build.');
    // Access the shared data using the custom 'of' method
    final inheritedWidget = CounterInheritedWidget.of(context);
    final counter = inheritedWidget?.counter ?? 0;

    return Text(
      '$counter',
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}