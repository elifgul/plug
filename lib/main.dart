import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/config/config_reader.dart';
import 'feature/domain/repository/user_repository.dart';
import 'feature/presentation/bloc/authentication/authentication_bloc.dart';
import 'feature/presentation/bloc/bloc.dart';
import 'feature/presentation/page/app.dart';
import 'injection_container.dart' as inject;

void mainCommon(String env) async{
  WidgetsFlutterBinding.ensureInitialized();
  await inject.init();
  await ConfigReader.initialize(env);
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final userRepository = UserRepository();
  runApp(
    BlocProvider<AuthenticationBloc>(
      create: (context) {
        return AuthenticationBloc(userRepository: userRepository)
          ..add(AppStarted());
      },
      child: PlugApp(userRepository: userRepository),
    ),
  );
}