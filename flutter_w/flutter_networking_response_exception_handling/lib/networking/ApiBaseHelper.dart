import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'app_exception.dart';

class ApiBaseHelper {
 // final String _baseUrl = "http://api.themoviedb.org/3/";
  final String _baseUrl = "https://api.escuelajs.co/api/v1/";
  final http.Client client;

  ApiBaseHelper({http.Client? client}) : client = client ?? http.Client();

  Future<dynamic> get(String url) async {
    return await _processRequest(() async {
      return await client.get(Uri.parse(_baseUrl + url));
    });
  }

  Future<dynamic> post(String url, dynamic body) async {
    return await _processRequest(() async {
      return await client.post(
        Uri.parse(_baseUrl + url),
        headers: {"Content-Type": "application/json"},
        body: json.encode(body),
      );
    });
  }

  Future<dynamic> put(String url, dynamic body) async {
    return await _processRequest(() async {
      return await client.put(
        Uri.parse(_baseUrl + url),
        headers: {"Content-Type": "application/json"},
        body: json.encode(body),
      );
    });
  }

  Future<dynamic> delete(String url) async {
    return await _processRequest(() async {
      return await client.delete(
        Uri.parse(_baseUrl + url),
        headers: {"Content-Type": "application/json"},
      );
    });
  }

  Future<dynamic> _processRequest(Future<http.Response> Function() requestFunction) async {
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

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while communicating with the server with StatusCode: ${response.statusCode}');
    }
  }
}
