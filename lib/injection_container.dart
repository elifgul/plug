import 'package:get_it/get_it.dart';
import 'package:plug/feature/data/datasource/ihale_local_datasource.dart';
import 'package:plug/feature/data/datasource/ihale_remote_datasource.dart';
import 'package:plug/feature/domain/repository/ihale_repository.dart';
import 'package:plug/feature/presentation/bloc/bloc.dart';
import 'package:plug/feature/presentation/bloc/ihale_bilgi_bloc.dart';

import 'feature/data/repository/ihale_repository_impl.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(
    () => IhaleBloc(
      ihaleRepository: sl(),
    ),
  );
  sl.registerFactory(
        () => IhaleBilgiBloc(
      ihaleRepository: sl(),
    ),
  );

  // Repository
  sl.registerLazySingleton<IhaleRepository>(
    () => IhaleRepositoryImpl(localDataSource: sl(), remoteDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<IhaleRemoteDataSource>(
    () => IhaleRemoteDataSourceImpl(),
  );

  sl.registerLazySingleton<IhaleLocalDataSource>(
    () => IhaleLocalDataSourceImpl(),
  );
}
