import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

class InternetConnectivity {
  // Singleton instance
  static final InternetConnectivity _instance = InternetConnectivity._internal();
  factory InternetConnectivity() => _instance;
  InternetConnectivity._internal();

  // Stream controller for connectivity changes
  final StreamController<bool> _connectionChangeController = StreamController<bool>.broadcast();
  final Connectivity _connectivity = Connectivity();

  // Expose the connectivity stream
  Stream<bool> get onConnectivityChanged => _connectionChangeController.stream;

  // Subscribe to connectivity changes
  void initialize() {
    _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      _checkInternetConnection(result);
    });
  }

  // Manually check the internet connection
  Future<bool> checkConnection() async {
    ConnectivityResult result = await _connectivity.checkConnectivity();
    return await _checkInternetConnection(result);
  }

  // Private method to check the connection status
  Future<bool> _checkInternetConnection(ConnectivityResult result) async {
    bool isConnected = result != ConnectivityResult.none;
    _connectionChangeController.add(isConnected);
    return isConnected;
  }

  // Dispose the stream when no longer needed
  void dispose() {
    _connectionChangeController.close();
  }
}
