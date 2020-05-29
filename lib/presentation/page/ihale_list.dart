import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:plug/core/config/config_reader.dart';
import 'package:plug/presentation/helper/ui_helper.dart';
import 'package:plug/core/model/ihale.dart';
import 'package:plug/core/service/ihale_service.dart';
import 'package:plug/presentation/page/login.dart';
import 'package:plug/presentation/widget/widgets.dart';

import 'ihale_bilgi.dart';

class IhaleListPage extends StatefulWidget {
  IhaleListPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _IhaleListPageState createState() => _IhaleListPageState();
}

class _IhaleListPageState extends State<IhaleListPage> {
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
        backgroundColor: UIHelper.PRIMARY_COLOR,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => LoginPage()));
            },
          )
        ],
      ),
      body: IhaleWidget(),
    );
  }
}

class IhaleWidget extends StatefulWidget {
  @override
  _IhaleWidgetState createState() => _IhaleWidgetState();
}

class _IhaleWidgetState extends State<IhaleWidget> {
  Timer timer;
  Future<List<Ihale>> ihaleList = IhaleApi.fetchIhaleList();

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(minutes: ConfigReader.getSyncronTimer()), (Timer t) => initIhaleList());
  }

  void initIhaleList() {
    setState(() {
      ihaleList = IhaleApi.fetchIhaleList();
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Widget getIhaleListWidget() {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.none &&
            snapshot.hasData == null) {
          return Container();
        } else if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              Ihale ihale = snapshot.data[index];
              return Card(
                  margin: new EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                  child: ListTile(
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    leading: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          ihale.id.toString(),
                          style: TextStyle(
                            fontSize: 12,
                            color: UIHelper.PRIMARY_COLOR,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            width: 45,
                            child:
                            new Divider(color: UIHelper.ACCENT_COLOR, thickness: 2),
                          ),
                        ),
                        Text(
                          ihale.usul,
                          style: TextStyle(
                            fontSize: 12,
                            color: UIHelper.PRIMARY_COLOR,
                          ),
                        ),
                      ],
                    ),
                    title: Text(
                      ihale.daireBasAdi + '\n' + ihale.mudurlukAdi,
                      style: TextStyle(
                        fontSize: 13,
                        color: UIHelper.PRIMARY_COLOR,
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
                                  style: TextStyle(
                                      fontSize: 12, color: UIHelper.PRIMARY_COLOR)),
                            )),
                        Expanded(
                          flex: 4,
                          child: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(ihale.isinAdi,
                                  style: TextStyle(
                                      fontSize: 12, color: UIHelper.PRIMARY_COLOR))),
                        )
                      ],
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.keyboard_arrow_right,
                          size: 25,
                          color: UIHelper.PRIMARY_COLOR,
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
            },
          );
        } else {
          return ColorLoader();
        }
      },
      future: ihaleList,
    );
  }

  @override
  Widget build(BuildContext context) {
    return getIhaleListWidget();
  }
}
