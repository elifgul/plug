import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:plug/feature/domain/entity/ihale.dart';
import 'package:plug/feature/presentation/bloc/bloc.dart';
import 'package:plug/feature/presentation/bloc/ihale_event.dart';
import 'package:plug/feature/presentation/bloc/ihale_state.dart';
import 'package:plug/feature/presentation/helper/ui_helper.dart';
import 'package:plug/feature/presentation/widget/loader.dart';

class IhaleBilgiPageBloc extends StatefulWidget {
  final Ihale ihale;

  IhaleBilgiPageBloc({this.ihale});

  @override
  _IhaleBilgiPageBlocState createState() => _IhaleBilgiPageBlocState();
}

class _IhaleBilgiPageBlocState extends State<IhaleBilgiPageBloc> {
  @override
  Widget build(BuildContext context) {
    return getIhaleBilgiBloc();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    BlocProvider.of<IhaleBilgiBloc>(context)..add(GetIhaleDetail(widget.ihale));
  }

  Widget getIhaleBilgiBloc() {
    return BlocBuilder<IhaleBilgiBloc, IhaleState>(
      builder: (context, state) {
       if (state is Loading) {
         return buildLoading();
        } else if (state is Loaded) {
          return getIhaleBilgiWidget(context, state);
        } else {
          return SnackBar(
            content: Text('Error State!'),
          );
        }
      },
    );
  }

  Widget buildLoading() {
    return Scaffold(
        body:Center(
      child: Container(
        color: UIHelper.WHITE_COLOR,
        child: ColorLoader(),
      ),
    ));
  }

  Widget getIhaleBilgiWidget(BuildContext context, Loaded state) {
    Ihale ihale = state.ihale;
    final price = Container(
      padding: const EdgeInsets.all(2),
      decoration: new BoxDecoration(
          border: new Border.all(color: UIHelper.WHITE_COLOR),
          borderRadius: BorderRadius.circular(5)),
      child: new Text(
        NumberFormat.currency(
                    locale: 'tr', customPattern: '#,###.##', decimalDigits: 2)
                .format(ihale.yaklasikMaliyet) +
            ' ₺',
        style: TextStyle(color: UIHelper.WHITE_COLOR, fontFamily: 'Montserrat'),
        textAlign: TextAlign.end,
      ),
    );

    final divider = Container(
      width: 15,
      child: new Divider(color: UIHelper.ACCENT_COLOR, thickness: 4),
    );

    textWidget(String text, {double fontSize: 14}) {
      return Padding(
          padding: EdgeInsets.only(left: 5),
          child: Text(
            text,
            style: TextStyle(
                color: UIHelper.WHITE_COLOR,
                fontFamily: 'Montserrat',
                fontSize: fontSize),
          ));
    }

    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 30),
        textWidget(ihale.id.toString(), fontSize: 25),
        Container(
          width: 115,
          child: new Divider(color: UIHelper.ACCENT_COLOR),
        ),
        SizedBox(height: 10),
        textWidget(ihale.isinAdi, fontSize: 15),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(child: divider),
            Expanded(flex: 3, child: textWidget(ihale.tur)),
            Expanded(flex: 4, child: price)
          ],
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(child: divider),
            Expanded(flex: 3, child: textWidget(ihale.usul)),
            Expanded(flex: 4, child: Text('')),
          ],
        ),
      ],
    );

    final topContent = Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * 0.35,
          padding: EdgeInsets.fromLTRB(40, 40, 40, 0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: UIHelper.PRIMARY_COLOR),
          child: Center(
            child: topContentText,
          ),
        ),
        Positioned(
          left: 8,
          top: 60,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: UIHelper.WHITE_COLOR),
          ),
        )
      ],
    );

    final bottomContentText = Text(
      ihale.aciklama,
      style: TextStyle(
          fontSize: 18,
          fontFamily: 'Montserrat',
          color: UIHelper.PRIMARY_COLOR),
    );

    button(String text, IconData icon, {Color color: UIHelper.WHITE_COLOR}) {
      return Container(
          width: MediaQuery.of(context).size.width * 0.25,
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 5),
          child: RaisedButton(
            onPressed: () => {},
            color: UIHelper.PRIMARY_COLOR,
            child: Row(
              children: <Widget>[
                Icon(
                  icon,
                  color: color,
                  size: 15,
                ),
                Padding(
                  padding: EdgeInsets.all(3),
                  child: Text(
                    text,
                    style: TextStyle(
                      color: UIHelper.WHITE_COLOR,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                )
              ],
            ),
          ));
    }

    final readButton =
        button("ONAY", Icons.check, color: UIHelper.ACCENT_COLOR);
    final cancelButton = button("RED", Icons.close, color: UIHelper.RED_COLOR);
    final explanationButton = button("İZAH", Icons.mail_outline);

    final bottomContent = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(40),
      child: Center(
        child: Column(
          children: <Widget>[
            bottomContentText,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [readButton, cancelButton, explanationButton],
            )
          ],
        ),
      ),
    );

    return Scaffold(
      body: Column(
        children: <Widget>[topContent, bottomContent],
      ),
    );
  }
}
