
import 'package:dio/dio.dart';

class DioApiClient {
  late Dio dio;

  DioApiClient() {
    dio = Dio();

    // Add interceptor for logging request and response
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        print("Request [${options.method}] => URL: ${options.uri}");
        print("Headers: ${options.headers}");
        print("Body: ${options.data}");
        return handler.next(options); // Continue with the request
      },
      onResponse: (response, handler) {
        print("Response [${response.statusCode}] => Data: ${response.data}");
        return handler.next(response); // Continue with the response
      },
      onError: (DioError e, handler) {
        print("Error: ${e.message}");
        return handler.next(e); // Continue with the error
      },
    ));
  }

}


