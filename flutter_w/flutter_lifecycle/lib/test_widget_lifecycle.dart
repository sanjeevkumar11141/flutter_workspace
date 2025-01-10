import 'package:flutter/material.dart';
import 'package:flutter_lifecycle/home_screen.dart';

class TestWidgetLifecycle extends StatefulWidget {
  const TestWidgetLifecycle({super.key});

  @override
  State<TestWidgetLifecycle> createState() => _TestWidgetLifecycleState();
}

class _TestWidgetLifecycleState extends State<TestWidgetLifecycle> {
  @override
  void initState() {
    super.initState();
    print('Sk initState: The widget is initialized.');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('Sk didChangeDependencies: Dependencies have changed.');
  }

  @override
  Widget build(BuildContext context) {
    String textValue = "Update Text Here";
    print('Sk build: The widget is being built.');
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Widget Lifecycle')),
      body: Center(
          child: Column(
        children: [
          Text(textValue, style: TextStyle(fontSize: 20.0,),),
          ElevatedButton(
              onPressed: () {
                //Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                setState(() {
                  textValue = "Updated Text After Button Click";
                });
              },
              child: Text("Go To Home Screen"))
        ],
      )),
    );
  }

  @override
  void didUpdateWidget(TestWidgetLifecycle oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('Sk didUpdateWidget: The widget has been updated.');
  }

  @override
  void deactivate() {
    super.deactivate();
    print('Sk deactivate: The widget is deactivated.');
  }

  @override
  void dispose() {
    print('Sk dispose: The widget is disposed.');
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
