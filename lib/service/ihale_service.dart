import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:plug/model/ihale.dart';

List<Ihale> data;

Future<List<Ihale>> fetchPhotos() async {
  final response = await http.get('http://localhost:8088/hys-web/api/plug/list');
  return parsePhotos(response.body);
}

List<Ihale> parsePhotos(String responseBody) {
  final parsed = json.decode(responseBody);
  data = parsed['data'].map<Ihale>((json) => Ihale.fromJson(json)).toList();
  return data;
}
