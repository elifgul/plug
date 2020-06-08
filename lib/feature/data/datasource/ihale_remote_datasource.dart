import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:plug/core/config/config_reader.dart';
import 'package:plug/feature/data/datasource/datasource.dart';
import 'package:plug/feature/data/model/ihale_model.dart';

abstract class IhaleRemoteDataSource extends BaseDataSource<IhaleModel> {}

class IhaleRemoteDataSourceImpl implements IhaleRemoteDataSource {
  @override
  Future<IhaleModel> get(int id) {}

  @override
  Future<List<IhaleModel>> getList() async {
    final response = await http.get(ConfigReader.getApiUrl());
    if (response.statusCode != 200) {
      throw new Exception('Unable to get ihaleList from the REST API');
    }
    return parse(response.body);
  }

  static List<IhaleModel> parse(String responseBody) {
    // decode: convert to map
    final parsed = json.decode(responseBody);
    return parsed['data']
        .map<IhaleModel>((json) => IhaleModel.fromJson(json))
        .toList();
  }
}
