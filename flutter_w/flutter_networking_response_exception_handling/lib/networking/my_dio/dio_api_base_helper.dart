import 'dart:io';
import 'package:dio/dio.dart';
import '../../helper/internet_connectivity.dart';
import '../app_exception.dart';


/*class DioApiBaseHelper {
  final String _baseUrl = "https://api.escuelajs.co/api/v1/";
  final Dio dio;

  DioApiBaseHelper({Dio? dio}) : dio = dio ?? Dio() {
    // Add interceptor for logging request and response
    this.dio.interceptors.add(InterceptorsWrapper(
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

  Future<dynamic> get(String url) async {
    return await _processRequest(() async {
      return await dio.get(_baseUrl + url);
    });
  }

  Future<dynamic> post(String url, dynamic body) async {
    return await _processRequest(() async {
      return await dio.post(
        _baseUrl + url,
        data: body,
        options: Options(
          headers: {"Content-Type": "application/json"},
        ),
      );
    });
  }

  Future<dynamic> put(String url, dynamic body) async {
    return await _processRequest(() async {
      return await dio.put(
        _baseUrl + url,
        data: body,
        options: Options(
          headers: {"Content-Type": "application/json"},
        ),
      );
    });
  }

  Future<dynamic> delete(String url) async {
    return await _processRequest(() async {
      return await dio.delete(
        _baseUrl + url,
        options: Options(
          headers: {"Content-Type": "application/json"},
        ),
      );
    });
  }

  Future<dynamic> _processRequest(Future<Response> Function() requestFunction) async {
    var responseJson;
    try {
      final response = await requestFunction();
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on FormatException {
      throw FetchDataException('Bad response format');
    }
    return responseJson;
  }

  dynamic _returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        var responseJson = response.data;
        print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.data.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.data.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while communicating with the server with StatusCode: ${response.statusCode}');
    }
  }
}*/


class DioApiBaseHelper {
  final String _baseUrl = "https://api.escuelajs.co/api/v1/";
  final Dio dio;

  DioApiBaseHelper({Dio? dio}) : dio = dio ?? Dio() {
    // Add interceptor for internet connectivity and logging request and response
    this.dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        bool isConnected = await InternetConnectivity().checkConnection();
        if (!isConnected) {
          return handler.reject(DioException(
            requestOptions: options,
            error: 'No Internet connection',
            type: DioExceptionType.unknown, // Updated from DioErrorType to DioExceptionType
          ));
        }
        // Log request
        print("Request [${options.method}] => URL: ${options.uri}");
        print("Headers: ${options.headers}");
        print("Body: ${options.data}");
        return handler.next(options); // Continue with the request
      },
      onResponse: (response, handler) {
        // Log response
        print("Response [${response.statusCode}] => Data: ${response.data}");
        return handler.next(response); // Continue with the response
      },
      onError: (DioException e, handler) {
        // Handle errors like logging them
        print("Error: ${e.message}");
        return handler.next(e); // Continue with the error
      },
    ));
  }

  Future<dynamic> get(String url) async {
    return await _processRequest(() async {
      return await dio.get(_baseUrl + url);
    });
  }

  Future<dynamic> post(String url, dynamic body) async {
    return await _processRequest(() async {
      return await dio.post(
        _baseUrl + url,
        data: body,
        options: Options(
          headers: {"Content-Type": "application/json"},
        ),
      );
    });
  }

  Future<dynamic> put(String url, dynamic body) async {
    return await _processRequest(() async {
      return await dio.put(
        _baseUrl + url,
        data: body,
        options: Options(
          headers: {"Content-Type": "application/json"},
        ),
      );
    });
  }

  Future<dynamic> delete(String url) async {
    return await _processRequest(() async {
      return await dio.delete(
        _baseUrl + url,
        options: Options(
          headers: {"Content-Type": "application/json"},
        ),
      );
    });
  }

  Future<dynamic> _processRequest(Future<Response> Function() requestFunction) async {
    var responseJson;
    try {
      final response = await requestFunction();
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on FormatException {
      throw FetchDataException('Bad response format');
    } on DioException catch (e) {
      if (e.error == 'No Internet connection') {
        throw FetchDataException(e.error as String?);
      }
      throw FetchDataException('Something went wrong');
    }
    return responseJson;
  }

  dynamic _returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        var responseJson = response.data;
        print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.data.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.data.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while communicating with the server with StatusCode: ${response.statusCode}');
    }
  }
}

