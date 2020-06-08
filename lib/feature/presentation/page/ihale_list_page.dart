import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:plug/feature/domain/entity/ihale.dart';
import 'package:plug/feature/presentation/bloc/bloc.dart';
import 'package:plug/feature/presentation/helper/ui_helper.dart';
import 'package:plug/feature/presentation/page/login_page.dart';
import 'package:plug/feature/presentation/widget/widgets.dart';

import 'ihale_bilgi_page.dart';

class IhaleListPage extends StatefulWidget {
  String title;

  IhaleListPage({this.title});

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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
          )
        ],
      ),
      body: getIhaleListBloc(),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    BlocProvider.of<IhaleBloc>(context)..add(GetIhaleList());
  }

  Widget getIhaleListBloc() {
    return BlocListener<IhaleBloc, IhaleState>(
        listener: (context, state) {
          if (state is Error) {
            Scaffold.of(context).showSnackBar(
              SnackBar(content: Text(state.message),),);
          }
          },
        child: BlocBuilder<IhaleBloc, IhaleState>(
          builder: (context, state) {
            if (state is ListLoading) {
              return ColorLoader();
            } else if (state is ListLoaded) {
              return getIhaleListWidget(context, state);
            } else {
              return SnackBar(content: Text('Error State'),);
            }
            },
    ));
  }

  Widget getIhaleListWidget(BuildContext context, ListLoaded state) {
    List<Card> listCard = getIhaleCardList(context, state);
    return ListView(
      children: listCard,
    );
  }

  List<Card> getIhaleCardList(BuildContext context, ListLoaded state) {
    List<Ihale> ihaleList = state.ihaleList;
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
    }).toList();
  }
}
