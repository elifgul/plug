import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plug/feature/presentation/bloc/bloc.dart';
import 'package:plug/feature/presentation/helper/ui_helper.dart';

class LoginForm extends StatefulWidget {
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final _loginFormKey = GlobalKey<FormState>();
    _onLoginButtonPressed() {
      if (_loginFormKey.currentState.validate()) {
        BlocProvider.of<LoginBloc>(context).add(
          LoginButtonPressed(
            username: _usernameController.text,
            password: _passwordController.text,
          ),
        );
      }
    }

    final logo = Padding(
      padding: EdgeInsets.only(bottom: 50),
      child: Hero(
          tag: 'hero',
          child: CircleAvatar(
              radius: 56,
              backgroundColor: UIHelper.WHITE_COLOR,
              child: Column(
                children: [
                  Image.asset('assets/ibb-logo.png'),
                  SizedBox(height: 30),
                  Text(
                    'HYS PLUG',
                    style: TextStyle(
                        color: UIHelper.PRIMARY_COLOR,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ))),
    );

    final inputEmail = Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: TextFormField(
        controller: _usernameController,
        validator: (value) {
          if (value.isEmpty) {
            return 'Lütfen kullanıcı adını giriniz.';
          }
          return null;
        },
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
      child: TextFormField(
        controller: _passwordController,
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
            _onLoginButtonPressed();
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

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('${state.error}'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Form(
            key: _loginFormKey,
            child: Center(
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 20),
                children: <Widget>[
                  logo,
                  inputEmail,
                  inputPassword,
                  buttonLogin,
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
