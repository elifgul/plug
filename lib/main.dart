import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:plug/ihaleBilgiPage.dart';
import 'package:plug/model/ihaleRepository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HYS PLUG',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(title: 'HYS PLUG'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 0.1,
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {},
          )
        ],
      ),
      body: IhaleListWidget(),
    );
  }
}

class IhaleListWidget extends StatelessWidget {
  List<Card> _buidIhaleCards(BuildContext context) {
    var ihaleList = IhaleRepository.loadIhaleList();
    if (ihaleList == null || ihaleList.isEmpty) {
      return const <Card>[];
    }
    return ihaleList.map((ihale) {
      return Card(
          margin: new EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            leading: Text(
              ihale.id.toString() + '\n' + ihale.tur + '/' + ihale.usul,
              style: TextStyle(fontSize: 11),
            ),
            title: Text(
              ihale.daireBasAdi + ' ' + ihale.mudurlukAdi,
              style: TextStyle(fontSize: 12),
            ),
            subtitle: Row(
              children: <Widget>[
                Expanded(
                    flex: 3,
                    child: Container(
                      child: Text(
                          NumberFormat.currency(
                                  locale: 'tr',
                                  customPattern: '#,###.## \u00a4',
                                  decimalDigits: 2)
                              .format(ihale.yaklasikMaliyet),
                          style: TextStyle(fontSize: 11)),
                    )),
                Expanded(
                  flex: 4,
                  child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child:
                          Text(ihale.isinAdi, style: TextStyle(fontSize: 12))),
                )
              ],
            ),
            trailing: Icon(Icons.keyboard_arrow_right, size: 25),
            onTap: () {
              Navigator.push(
              context,
              MaterialPageRoute(
              builder: (context) => IhaleBilgiPage(ihale)));
            },
          ));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: _buidIhaleCards(context));
  }
}
