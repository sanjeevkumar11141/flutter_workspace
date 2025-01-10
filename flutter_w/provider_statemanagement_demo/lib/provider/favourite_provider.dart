import 'package:flutter/foundation.dart';

class FavouriteProvider with ChangeNotifier{
  List<int> _selectedItemList = [];

  List<int> get selectedItemList => _selectedItemList;

  void addItem(int value){
    _selectedItemList.add(value);
    notifyListeners();
  }
  void removeItem(int index){
    if(_selectedItemList.contains(index)){
      _selectedItemList.remove(index);
      notifyListeners();
    }
  }


}