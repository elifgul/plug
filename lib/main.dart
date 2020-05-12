import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:plug/helper/colors.dart';
import 'package:plug/model/ihale_repository.dart';
import 'package:plug/page/ihale_bilgi_page.dart';

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
        leading: IconButton(
          icon: Icon(Icons.list),
          onPressed: () {},
        ),
        title: Text(widget.title),
        elevation: 0.1,
        backgroundColor: PRIMARY_COLOR,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
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
          margin: new EdgeInsets.symmetric(horizontal: 5, vertical: 3),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  ihale.id.toString(),
                  style: TextStyle(
                    fontSize: 12,
                    color: PRIMARY_COLOR,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: 45,
                    child: new Divider(color: Colors.green, thickness: 2),
                  ),
                ),
                Text(
                  ihale.usul,
                  style: TextStyle(
                    fontSize: 12,
                    color: PRIMARY_COLOR,
                  ),
                ),
              ],
            ),
            title: Text(
              ihale.daireBasAdi + '\n' + ihale.mudurlukAdi,
              style: TextStyle(
                fontSize: 13,
                color: PRIMARY_COLOR,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Row(
              children: <Widget>[
                Expanded(
                    flex: 3,
                    child: Container(
                      child: Text(
                          NumberFormat.currency(
                                      locale: 'tr',
                                      customPattern: '#,###.##',
                                      decimalDigits: 2)
                                  .format(ihale.yaklasikMaliyet) +
                              ' ₺',
                          style: TextStyle(fontSize: 12, color: PRIMARY_COLOR)),
                    )),
                Expanded(
                  flex: 4,
                  child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(ihale.isinAdi,
                          style:
                              TextStyle(fontSize: 12, color: PRIMARY_COLOR))),
                )
              ],
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.keyboard_arrow_right,
                  size: 25,
                  color: PRIMARY_COLOR,
                ),
              ],
            ),
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
