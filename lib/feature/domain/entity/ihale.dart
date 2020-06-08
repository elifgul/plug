import 'package:flutter/material.dart';

class Ihale {
  Ihale({
      @required this.id,
      @required this.dosyaId,
      @required this.isinAdi,
      this.aciklama,
      @required this.daireBasAdi,
      @required this.mudurlukAdi,
      @required this.tur,
      @required this.usul,
      @required this.yaklasikMaliyet});

  int id;
  String dosyaId;
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
