import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    print('Sk home initState: The widget is initialized.');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('Sk home didChangeDependencies: Dependencies have changed.');
  }

  @override
  Widget build(BuildContext context) {
    print('Sk home build: The widget is being built.');
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Widget Lifecycle')),
      body: Center(child: Text('Home Screen for lifecycle methods.')),
    );
  }

  @override
  void didUpdateWidget(HomeScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('Sk home didUpdateWidget: The widget has been updated.');
  }

  @override
  void deactivate() {
    super.deactivate();
    print('Sk home deactivate: The widget is deactivated.');
  }

  @override
  void dispose() {
    print('Sk home dispose: The widget is disposed.');
    super.dispose();
  }
}
