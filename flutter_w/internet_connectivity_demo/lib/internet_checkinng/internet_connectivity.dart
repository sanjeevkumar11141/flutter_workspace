import 'package:connectivity_plus/connectivity_plus.dart';

class InternetConnectivity {
  // Method to check if the device is connected to the internet
  /*Future<bool> isConnected() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    print("connectivityResult"+connectivityResult.toString());
    if (connectivityResult.contains(ConnectivityResult.mobile )  || connectivityResult.contains(ConnectivityResult.wifi)) {
      return true;
    } else {
      return false;
    }
  }

  // Method to listen to connectivity changes in real-time
  Stream<List<ConnectivityResult>> get connectivityStream {
    return Connectivity().onConnectivityChanged;
  }*/
}
