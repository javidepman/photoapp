import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:photoapp/core/domain/models/home_model.dart';

class AppBPApiClient {
  static const baseUrl = 'https://api.unsplash.com';
  int? statusCode = 0;

  Future<List<HomeModel>> doPhoto() async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    var queryParams = {'client_id': 'a2f508640cb62f314e0e0763594d40aab1c858a7ef796184067c537a88b276aa'};
    final photosUrl = Uri.parse('$baseUrl/photos').replace(queryParameters: queryParams);
    final response = await http.get(photosUrl, headers: headers);
    statusCode = response.statusCode;
    if (kDebugMode) {
      print('Status code Photos>>>>>>>>>>>>>>>>>>>>>>>>>>> $statusCode');
    }
    if (response.statusCode != 200) {
      throw const AppBPApiException('Error getting data for Dni');
    }

    final photosJason = jsonDecode(response.body);

    List<HomeModel> homePhotos =
    (json.decode((utf8.decode(response.bodyBytes))) as List)
        .map((e) => HomeModel.fromJson(e))
        .toList();

    return homePhotos;
  }

  Future<List<HomeModel>> getPhotos() async {
    return doPhoto();
  }

}

class AppBPApiException implements Exception {
  const AppBPApiException(this.message);

  final String message;
}