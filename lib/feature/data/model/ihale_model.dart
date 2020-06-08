import 'package:plug/feature/domain/entity/ihale.dart';

class IhaleModel extends Ihale {
  IhaleModel(
      {int id,
      String dosyaId,
      String isinAdi,
      String aciklama,
      String daireBasAdi,
      String mudurlukAdi,
      String tur,
      String usul,
      double yaklasikMaliyet})
      : super(
            id: id,
            dosyaId: dosyaId,
            isinAdi: isinAdi,
            aciklama: aciklama,
            daireBasAdi: daireBasAdi,
            mudurlukAdi: mudurlukAdi,
            tur: tur,
            usul: usul,
            yaklasikMaliyet: yaklasikMaliyet);

  factory IhaleModel.fromJson(Map<String, dynamic> json) {
    return IhaleModel(
      id: json['id'],
      dosyaId: json['dosyaId'],
      isinAdi: json['isinAdi'],
      aciklama: json['aciklama'],
      daireBasAdi: json['daireBasAd'],
      mudurlukAdi: json['mudurlukAd'],
      tur: json['tur'],
      usul: json['usul'],
      yaklasikMaliyet: json['yaklasikMaliyet'],
    );
  }
}
