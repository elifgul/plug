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


  factory Ihale.fromJson(Map<String, dynamic> json) {
    return Ihale(
      id: json['id'],
      isinAdi: json['isinAdi'],
      aciklama: json['aciklama'],
      daireBasAdi: json['daireBasAd'],
      mudurlukAdi: json['mudurlukAd'],
      tur: json['tur'],
      usul: json['usul'],
      yaklasikMaliyet: json['yaklasikMaliyet'],
    );
  }

  @override
  String toString() {
    return isinAdi;
  }
}
