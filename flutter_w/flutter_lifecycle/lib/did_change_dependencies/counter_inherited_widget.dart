import 'package:flutter/material.dart';

// Define your custom InheritedWidget
class CounterInheritedWidget extends InheritedWidget {
  // The shared data (in this case, a counter value)
  final int counter;
  final Widget child;

  // Constructor for the InheritedWidget
  CounterInheritedWidget({
    Key? key,
    required this.counter,
    required this.child,
  }) : super(key: key, child: child);

  // Static method to allow descendants to access the widget's data
  static CounterInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CounterInheritedWidget>();
  }

  // Determines whether to notify widgets when the data changes
  @override
  bool updateShouldNotify(CounterInheritedWidget oldWidget) {
    // Return true if the counter value has changed
    return oldWidget.counter != counter;
  }
}
