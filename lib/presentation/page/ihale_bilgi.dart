import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:plug/presentation/helper/ui_helper.dart';
import 'package:plug/core/model/ihale.dart';

class IhaleBilgiPage extends StatelessWidget {
  IhaleBilgiPage(this.ihale);

  final Ihale ihale;

  @override
  Widget build(BuildContext context) {
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
        style: TextStyle(color: UIHelper.WHITE_COLOR),
        textAlign: TextAlign.end,
      ),
    );

    final divider = Container(
      width: 15,
      child: new Divider(color: UIHelper.GREEN_COLOR, thickness: 4),
    );

    textWidget(String text, {double fontSize: 14}) {
      return Padding(
          padding: EdgeInsets.only(left: 2),
          child: Text(
            text,
            style: TextStyle(color: UIHelper.WHITE_COLOR, fontSize: fontSize),
          ));
    }

    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 40),
        textWidget(ihale.id.toString(), fontSize: 25),
        Container(
          width: 115,
          child: new Divider(color: UIHelper.GREEN_COLOR),
        ),
        SizedBox(height: 10),
        textWidget(ihale.isinAdi, fontSize: 15),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(child: divider),
            Expanded(flex: 1, child: textWidget(ihale.tur)),
            Expanded(child: divider),
            Expanded(flex: 2, child: textWidget(ihale.usul)),
            Expanded(flex: 3, child: price)
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
      style: TextStyle(fontSize: 18),
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
                Icon(icon, color: color, size: 15, ),
                Padding (
                  padding: EdgeInsets.all(3),
                  child: Text(text, style: TextStyle(color: UIHelper.WHITE_COLOR),),
                )
              ],
            ),
          ));
    }
    final readButton = button("ONAY", Icons.check, color: UIHelper.GREEN_COLOR);
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
