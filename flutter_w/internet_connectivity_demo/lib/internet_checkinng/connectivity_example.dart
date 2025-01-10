import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'internet_connectivity.dart'; // Import the class you created

class ConnectivityExample extends StatefulWidget {
  @override
  _ConnectivityExampleState createState() => _ConnectivityExampleState();
}

class _ConnectivityExampleState extends State<ConnectivityExample> {
  final InternetConnectivity _internetConnectivity = InternetConnectivity();
  bool _isConnected = false;

  @override
  void initState() {
    super.initState();
    _checkInternetConnection();

    // Listen to connectivity changes
    // _internetConnectivity.connectivityStream.listen((result) {
    //   print("Stream Data Listener"+result.toString());
    //   setState(() {
    //     _isConnected = (result.contains(ConnectivityResult.mobile)  || result.contains(ConnectivityResult.wifi) );
    //   });
    // });
  }

  // Function to check the internet connection status initially
  Future<void> _checkInternetConnection() async {
    // bool isConnected = await _internetConnectivity.isConnected();
    // setState(() {
    //   _isConnected = isConnected;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Internet Connectivity Check"),
      ),
      body: Center(
        child: Text(
          _isConnected ? "Connected to the Internet" : "No Internet Connection",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
