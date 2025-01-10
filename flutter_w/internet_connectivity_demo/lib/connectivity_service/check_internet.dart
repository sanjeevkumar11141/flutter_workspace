import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'internet_connectivity.dart';  // Import the class from above


class CheckInternet extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<CheckInternet> {
  bool _isConnected = true;  // Default is connected

  @override
  void initState() {
    super.initState();
    _initializeConnectivity();
  }

  // Initialize the internet connectivity listener
  void _initializeConnectivity() {
    final InternetConnectivity connectivity = InternetConnectivity();
    connectivity.initialize();
    // Listen for connectivity changes
    connectivity.onConnectivityChanged.listen((bool isConnected) {
      setState(() {
        _isConnected = isConnected;
      });
    });

    // Optionally, check the connection at startup
    connectivity.checkConnection().then((bool isConnected) {
      setState(() {
        _isConnected = isConnected;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Internet Connectivity Example'),
        ),
        body: Center(
          child: _isConnected
              ? Text(
            'You are connected to the internet',
            style: TextStyle(color: Colors.green, fontSize: 20),
          )
              : Text(
            'No internet connection',
            style: TextStyle(color: Colors.red, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
