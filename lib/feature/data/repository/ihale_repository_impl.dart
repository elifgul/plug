import 'package:flutter/material.dart';
import 'package:plug/core/config/config_reader.dart';
import 'package:plug/core/config/environment.dart';
import 'package:plug/feature/data/datasource/datasource.dart';
import 'package:plug/feature/domain/entity/ihale.dart';
import 'package:plug/feature/domain/repository/ihale_repository.dart';

class IhaleRepositoryImpl implements IhaleRepository {
  final IhaleRemoteDataSource remoteDataSource;
  final IhaleLocalDataSource localDataSource;

  IhaleRepositoryImpl({
    @required this.remoteDataSource,
    @required this.localDataSource,
  });

  @override
  Future<List<Ihale>> getIhaleList() {
    return getDataSource().getList();
  }

  @override
  Future<Ihale> getIhale(int id) {
    return getDataSource().get(id);
  }

  @override
  Future<bool> confirmIhale(int id) {}

  @override
  Future<bool> rejectIhale(int id) {}

  @override
  Future<bool> explanationIhale(int id) {}

  BaseDataSource getDataSource() {
    if (ConfigReader.environment == Environment.dev) {
      return localDataSource;
    } else {
      return remoteDataSource;
    }
  }
}
