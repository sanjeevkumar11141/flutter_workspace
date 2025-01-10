import '../networking/api_response.dart';
import '../networking/dio_api_base_helper.dart';


class ApiRepository {
  final DioApiBaseHelper _apiHelper;

  ApiRepository(this._apiHelper);

  Future<ApiResponse<dynamic>> fetchPosts() async {
    try {
      final response = await _apiHelper.get('posts'); // Calls the 'posts' endpoint
      return ApiResponse.completed(response);
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }
}

