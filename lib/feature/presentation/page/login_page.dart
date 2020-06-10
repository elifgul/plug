import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plug/feature/data/datasource/datasource.dart';
import 'package:plug/feature/data/repository/ihale_repository_impl.dart';
import 'package:plug/feature/presentation/bloc/bloc.dart';
import 'package:plug/feature/presentation/helper/ui_helper.dart';

import 'ihale_list_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final logo = Padding(
      padding: EdgeInsets.only(bottom: 50),
      child: Hero(
          tag: 'hero',
          child: CircleAvatar(
            radius: 56,
            backgroundColor: UIHelper.WHITE_COLOR,
            child: Column (children: [
              Image.asset('assets/ibb-logo.png'),
              SizedBox(height: 30),
              Text('HYS PLUG', style: TextStyle(color: UIHelper.PRIMARY_COLOR, fontWeight: FontWeight.bold),),
            ],)
          )),
    );
    final inputEmail = Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            hintText: 'Kullanıcı Adı',
            contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(50))),
      ),
    );
    final inputPassword = Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        obscureText: true,
        decoration: InputDecoration(
            hintText: 'Şifre',
            contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(50))),
      ),
    );
    final buttonLogin = Padding(
      padding: EdgeInsets.only(bottom: 5),
      child: ButtonTheme(
        height: 56,
        child: RaisedButton(
          child: Text('Giriş Yap',
              style: TextStyle(color: UIHelper.WHITE_COLOR, fontSize: 20)),
          color: UIHelper.PRIMARY_COLOR,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => BlocProvider(
                create: (context) => IhaleBloc(ihaleRepository: IhaleRepositoryImpl(localDataSource: IhaleLocalDataSourceImpl(), remoteDataSource: IhaleRemoteDataSourceImpl())),
                  child: IhaleListPage(title: 'HYS PLUG'),
            ),
            ));
          },
        ),
      ),
    );

    final buttonForgotPassword = FlatButton(
        child: Text(
          'Şifremi Unuttum',
          style: TextStyle(color: UIHelper.GREY_COLOR, fontSize: 16),
        ),
        onPressed: null);
    return Scaffold(
      backgroundColor: UIHelper.WHITE_COLOR,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 20),
          children: <Widget>[
            logo,
            inputEmail,
            inputPassword,
            buttonLogin,
            buttonForgotPassword
          ],
        ),
      ),
    );
  }
}
