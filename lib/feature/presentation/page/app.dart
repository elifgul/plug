import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plug/feature/presentation/bloc/bloc.dart';
import 'package:plug/feature/presentation/page/ihale_list_page.dart';

import '../../../injection_container.dart';

class PlugApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HYS PLUG',
      home: BlocProvider(
        create: (_) => sl<IhaleBloc>(),
        child: IhaleListPage(
          title: 'HYS PLUG',
        ),
      ),
    );
  }
}
