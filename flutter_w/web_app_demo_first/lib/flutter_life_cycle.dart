import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    print('initState: The widget is initialized.');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didChangeDependencies: Dependencies have changed.');
  }

  @override
  Widget build(BuildContext context) {
    print('build: The widget is being built.');
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Widget Lifecycle')),
      body: Center(child: Text('Observe console for lifecycle methods.')),
    );
  }

  @override
  void didUpdateWidget(MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget: The widget has been updated.');
  }

  @override
  void deactivate() {
    super.deactivate();
    print('deactivate: The widget is deactivated.');
  }

  @override
  void dispose() {
    print('dispose: The widget is disposed.');
    super.dispose();
  }
}

// Explanation of the Example:
// initState() is called when the widget is created.
// didChangeDependencies() is called right after initState() and when dependencies change.
// build() is called when the widget is built and whenever setState is called.
// didUpdateWidget() is called if the parent widget rebuilds and provides a new configuration to the child.
// deactivate() is called when the widget is removed from the tree temporarily.
// dispose() is called when the widget is permanently removed from the tree and should clean up any resources used.

