import 'package:flutter/material.dart';
import 'package:plug/presentation/helper/ui_helper.dart';
import 'package:plug/presentation/page/ihale_list.dart';

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
              Image.asset('assets/logo.png'),
              SizedBox(height: 10),
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
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => IhaleListPage(
                          title: 'HYS PLUG',
                        )));
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
