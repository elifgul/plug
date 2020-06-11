import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plug/feature/presentation/bloc/bloc.dart';
import 'package:plug/feature/presentation/helper/ui_helper.dart';
import 'package:plug/feature/presentation/widget/loader.dart';

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.list),
            onPressed: () {},
          ),
          title: Text('HYS PLUG'),
          elevation: 0.1,
          backgroundColor: UIHelper.PRIMARY_COLOR,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
              },
            )
          ],
        ),
        body: Container(
          color: UIHelper.WHITE_COLOR,
          child: ColorLoader(),
        ),
      );
}
