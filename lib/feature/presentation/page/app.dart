import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plug/feature/domain/repository/user_repository.dart';
import 'package:plug/feature/presentation/bloc/bloc.dart';
import 'package:plug/feature/presentation/page/ihale_list_page.dart';
import 'package:plug/feature/presentation/widget/loading_indicator.dart';

import '../../../injection_container.dart';
import 'login_page.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    print(event);
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print(transition);
    super.onTransition(bloc, transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stackTrace) {
    print(error);
    super.onError(bloc, error, stackTrace);
  }
}

class PlugApp extends StatelessWidget {
  final UserRepository userRepository;

  PlugApp({Key key, @required this.userRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationUninitialized || state is AuthenticationLoading) {
            return LoadingIndicator();
          } else if (state is AuthenticationAuthenticated) {
            return BlocProvider(
              create: (_) => sl<IhaleBloc>(),
              child: IhaleListPage(
                title: 'HYS PLUG',
              ),
            );
          } else {
            return LoginPage(userRepository: userRepository);
          }
        },
      ),
    );
  }

}
