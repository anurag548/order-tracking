import 'dart:convert';

import 'package:http/http.dart' as http;

import 'app_exceptions.dart';

class BaseUrl {
  Future<dynamic> get(String baseUrl) async {
    var uri = Uri.parse(baseUrl);
    try {
      var results = await http.get(uri);
      return _proccessResponse(results);
    } catch (e) {
      print(e);
    }
  }

  dynamic _proccessResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      //break;
      case 400:
        throw BadRequestException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());

      case 403:
        throw UnauthorizedException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 500:
        throw FetchDataException(
            'Error occured with code: ${response.statusCode}',
            response.request!.url.toString());
      default:
    }
  }
}
