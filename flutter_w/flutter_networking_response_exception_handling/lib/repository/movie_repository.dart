import '../models/item_model.dart';
import '../networking/ApiBaseHelper.dart';

class MovieRepository {
  final String _apiKey = "Paste your api key here";

  ApiBaseHelper _helper = ApiBaseHelper();

  Future<List<Result>> fetchMovieList() async {
    final response = await _helper.get("movie/popular?api_key=$_apiKey");
    return ItemModel.fromJson(response).results;
  }
}