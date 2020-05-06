import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:plug/model/ihale.dart';

class IhaleBilgiPage extends StatelessWidget {

  IhaleBilgiPage(this.ihale);

  final Ihale ihale;

  @override
  Widget build(BuildContext context) {
    final levelIndicator = Container(
      child: Container(
        child: LinearProgressIndicator(
            backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
            value: ihale.yaklasikMaliyet,
            valueColor: AlwaysStoppedAnimation(Colors.green)),
      ),
    );

    final coursePrice = Container(
      padding: const EdgeInsets.all(7.0),
      decoration: new BoxDecoration(
          border: new Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(5.0)),
      child: new Text(
          NumberFormat.currency(
              locale: 'tr',
              customPattern: '#,###.## \u00a4',
              decimalDigits: 2)
              .format(ihale.yaklasikMaliyet),
        style: TextStyle(color: Colors.white),
      ),
    );

    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 60),
        Text(
          ihale.id.toString(),
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        Container(
          width: 120,
          child: new Divider(color: Colors.green),
        ),
        SizedBox(height: 10.0),
        Text(
          ihale.isinAdi,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        SizedBox(height: 30.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(flex: 1, child: levelIndicator),
            Expanded(
                flex: 2,
                child: Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(
                      ihale.tur,
                      style: TextStyle(color: Colors.white),
                    ))),
            Expanded(flex: 1, child: levelIndicator),
            Expanded(
                flex: 2,
                child: Padding(
                    padding: EdgeInsets.only(left:5),
                    child: Text(
                      ihale.usul,
                      style: TextStyle(color: Colors.white),
                    ))),
            Expanded(flex: 5, child: coursePrice)
          ],
        ),
      ],
    );

    final topContent = Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * 0.40,
          padding: EdgeInsets.fromLTRB(40,40,40,0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, .9)),
          child: Center(
            child: topContentText,
          ),
        ),
        Positioned(
          left: 8.0,
          top: 60.0,
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
      style: TextStyle(fontSize: 18.0),
    );
    final readButton = Container(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        width: MediaQuery.of(context).size.width,
        child: RaisedButton(
          onPressed: () => {},
          color: Color.fromRGBO(58, 66, 86, 1.0),
          child:
          Text("ONAYLA", style: TextStyle(color: Colors.white)),
        ));
    final bottomContent = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          children: <Widget>[bottomContentText, readButton],
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
