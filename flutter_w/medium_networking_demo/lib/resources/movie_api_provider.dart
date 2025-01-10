import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/item_model.dart';

class MovieApiProvider {
  Client client = Client();
  final _apiKey = '181364e30b2c912f2a895a915074fa5d';

  Future<ItemModel> fetchMovieList() async {
    print("entered");
    final response = await client.get(
      Uri.parse("http://api.themoviedb.org/3/movie/popular?api_key=$_apiKey"),
    );
    print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load movie list: ${response.statusCode}');
    }
  }
}