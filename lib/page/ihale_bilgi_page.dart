import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:plug/helper/colors.dart';
import 'package:plug/model/ihale.dart';

class IhaleBilgiPage extends StatelessWidget {
  IhaleBilgiPage(this.ihale);

  final Ihale ihale;

  @override
  Widget build(BuildContext context) {
    final coursePrice = Container(
      padding: const EdgeInsets.all(2),
      decoration: new BoxDecoration(
          border: new Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(5)),
      child: new Text(
        NumberFormat.currency(
                locale: 'tr',
                customPattern: '#,###.##',
                decimalDigits: 2)
            .format(ihale.yaklasikMaliyet) + ' ₺',
        style: TextStyle(color: Colors.white),textAlign: TextAlign.end,
      ),
    );

    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 40),
        Text(
          ihale.id.toString(),
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        Container(
          width: 115,
          child: new Divider(color: Colors.green),
        ),
        SizedBox(height: 10),
        Text(
          ihale.isinAdi,
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Container(
                width: 15,
                child: new Divider(color: Colors.green, thickness: 4),
              ),
            ),
            Expanded(
                flex: 1,
                child: Padding(
                    padding: EdgeInsets.only(left: 2),
                    child: Text(
                      ihale.tur,
                      style: TextStyle(color: Colors.white),
                    ))),
            Expanded(
              child: Container(
                width: 15,
                child: new Divider(color: Colors.green, thickness: 4,),
              ),
            ),
            Expanded(
                flex: 2,
                child: Padding(
                    padding: EdgeInsets.only(left: 2),
                    child: Text(
                      ihale.usul,
                      style: TextStyle(color: Colors.white),
                    ))),
            Expanded(flex: 3, child: coursePrice)
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
          decoration: BoxDecoration(color: PRIMARY_COLOR),
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
            child: Icon(Icons.arrow_back, color: Colors.white),
          ),
        )
      ],
    );

    final bottomContentText = Text(
      ihale.aciklama,
      style: TextStyle(fontSize: 18),
    );
    final readButton = Container(
        width: MediaQuery.of(context).size.width * 0.25,
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 5),
        child: RaisedButton(
          onPressed: () => {},
          color: PRIMARY_COLOR,
          child: Text("ONAYLA", style: TextStyle(color: Colors.white)),
        ));
    final cancelButton = Container(
        width: MediaQuery.of(context).size.width * 0.25,
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 5),
        child: RaisedButton(
          onPressed: () => {},
          color: PRIMARY_COLOR,
          child: Text("REDDET", style: TextStyle(color: Colors.white)),
        ));
    final explanationButton = Container(
        width: MediaQuery.of(context).size.width * 0.25,
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 5),
        child: RaisedButton(
          onPressed: () => {},
          color: PRIMARY_COLOR,
          child: Text("İZAH", style: TextStyle(color: Colors.white)),
        ));
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
