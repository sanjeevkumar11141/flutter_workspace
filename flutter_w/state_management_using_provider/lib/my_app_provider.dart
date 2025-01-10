import 'package:flutter/foundation.dart';

class MyAppProvider extends ChangeNotifier{
  int _counter = 0;

  int get counter => _counter;

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }
}