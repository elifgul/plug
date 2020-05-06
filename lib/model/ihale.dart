import 'package:flutter/cupertino.dart';

class Ihale {
  Ihale({
      @required this.id,
      @required this.isinAdi,
      this.aciklama,
      @required this.daireBasAdi,
      @required this.mudurlukAdi,
      @required this.tur,
      @required this.usul,
      @required this.yaklasikMaliyet});

  int id;
  String isinAdi;
  String aciklama;
  String daireBasAdi;
  String mudurlukAdi;
  String tur;
  String usul;
  double yaklasikMaliyet;

  @override
  String toString() {
    return isinAdi;
  }
}
