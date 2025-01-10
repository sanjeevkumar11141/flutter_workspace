import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class AuthProvider with ChangeNotifier {

  var _loading  = false;

  get loading => _loading;

  void setLoading(bool value ){
    _loading = value;
    notifyListeners();
  }

  void login(String email, String password) async {
    setLoading(true);
    try {
      Response response = await post(Uri.parse("https://reqres.in/api/login"),
          body: {"email": email, "password": password});
      if (response.statusCode == 200) {
        print("API Succesfull");
      } else {
        print("API Failed");
      }
      setLoading(false);
    } catch (e) {
      print(e.toString());
      setLoading(false);
    }
  }
}
