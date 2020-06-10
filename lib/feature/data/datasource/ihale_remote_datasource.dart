import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:plug/core/config/config_reader.dart';
import 'package:plug/feature/data/datasource/ihale_datasource.dart';
import 'package:plug/feature/data/model/ihale_model.dart';

abstract class IhaleRemoteDataSource extends IhaleDataSource {}

class IhaleRemoteDataSourceImpl implements IhaleRemoteDataSource {

  @override
  Future<IhaleModel> get(int id) async {
    String apiUrl = ConfigReader.getApiUrl();
    final response = await http.get('$apiUrl/ihale?ihaleId=$id');
    if (response.statusCode != 200) {
      throw new Exception('Unable to get ihale from the REST API');
    }
    final parsed = json.decode(response.body);
    return IhaleModel.fromJson(parsed['data']);
  }

  @override
  Future<List<IhaleModel>> getList() async {
    final response = await http.get(ConfigReader.getApiUrl()+'/list');
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

  @override
  Future<IhaleModel> explanationIhale(int id) {

  }

  @override
  Future<IhaleModel> rejectIhale(int id) {

  }

  @override
  Future<IhaleModel> confirmIhale(int id) {

  }
}
