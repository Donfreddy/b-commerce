import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:chat_screen/api/custom_exception.dart';

class HttpClient {
  /// This class is not meant to be instantiated or extended.
  /// this constructor prevents(empeche) instantiation and extension.
  HttpClient._privateConstructor();

  /// We use the singleton pattern to ensure that we have only
  /// one class instance and provide a global point access to it.
  static final HttpClient _instance = HttpClient._privateConstructor();

  factory HttpClient() {
    return _instance;
  }

  final String _baseUrl = "http://192.168.43.231:8080/api";

  Future<dynamic> getRequest(String url) async {
    var responseJson;

    try {
      final response = await http.get(_baseUrl + url);
      responseJson = _response(response);
    } on SocketException {
      throw ConnectionException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> postRequest(String url, {dynamic data}) async {
    var responseJson;

    print("============> data to post");
    print(data);

    try {
      final response = await http.post(_baseUrl + url, body: data);
      responseJson = _response(response);
    } on SocketException {
      throw ConnectionException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> patchRequest(String url, {dynamic data}) async {
    var responseJson;

    try {
      final response = await http.patch(_baseUrl + url, body: data);
      responseJson = _response(response);
    } on SocketException {
      throw ConnectionException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> deleteRequest(String url) async {
    var responseJson;

    try {
      final response = await http.delete(_baseUrl + url);
      responseJson = _response(response);
    } on SocketException {
      throw ConnectionException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 201:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
        throw BadRequestException(response.body.toString());
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
        throw ServerErrorException(response.body.toString());
      default:
        throw UnknownException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
