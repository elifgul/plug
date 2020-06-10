import 'package:plug/feature/data/datasource/base/base_datasource.dart';
import 'package:plug/feature/data/model/ihale_model.dart';

abstract class IhaleDataSource extends BaseDataSource<IhaleModel> {

  Future<IhaleModel> confirmIhale(int id);
  Future<IhaleModel> rejectIhale(int id);
  Future<IhaleModel> explanationIhale(int id);
}