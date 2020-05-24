import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:plug/core/config/config_reader.dart';
import 'package:plug/core/model/ihale.dart';

abstract class IhaleApi {
  static Future<List<Ihale>> fetchIhaleList() async {
    final response = await http.get(ConfigReader.getApiUrl());
    if (response.statusCode != 200) {
      throw new Exception('Unable to fetch ihaleList from the REST API');
    }
    return parsePhotos(response.body);
  }
  static List<Ihale> parsePhotos(String responseBody) {
    // decode: convert to map
    final parsed = json.decode(responseBody);
    return parsed['data'].map<Ihale>((json) => Ihale.fromJson(json)).toList();
  }
}



