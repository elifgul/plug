import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:plug/config/config_reader.dart';
import 'package:plug/model/ihale.dart';

abstract class IhaleApi {
  static List<Ihale> data;
  static Future<List<Ihale>> fetchIhaleList() async {
    final response = await http.get(ConfigReader.getApiUrl());
    return parsePhotos(response.body);
  }
  static List<Ihale> parsePhotos(String responseBody) {
    final parsed = json.decode(responseBody);
    data = parsed['data'].map<Ihale>((json) => Ihale.fromJson(json)).toList();
    return data;
  }
}



