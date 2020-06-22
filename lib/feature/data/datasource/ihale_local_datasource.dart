import 'package:plug/feature/data/model/ihale_model.dart';

import 'ihale_datasource.dart';

abstract class IhaleLocalDataSource extends IhaleDataSource {}

class IhaleLocalDataSourceImpl implements IhaleLocalDataSource {
  @override
  Future<IhaleModel> get(int id) async {
    List<IhaleModel> allIhaleList = await getList();
    for (var ihaleModel in allIhaleList) {
      if (ihaleModel.id == id) {
        return ihaleModel;
      }
    }
    return null;
  }

  @override
  Future<List<IhaleModel>> getList() async {
    List<IhaleModel> allIhaleList = <IhaleModel>[
      IhaleModel(
        id: 13122222,
        dosyaId: '13122222',
        isinAdi: 'Sağlık Malzemesi Alımı',
        aciklama:
            'İhale dokümanı ekinde yer alan Talep Dağılım Cetvelindeki hastanelere teslim edilecektir.',
        mudurlukAdi: 'Satınalma Müdürlüğü',
        daireBasAdi: 'Satınalma Daire Başkanlığı',
        tur: 'İhale',
        usul: '4734/19',
        yaklasikMaliyet: 2100000,
      ),
      IhaleModel(
        id: 13123909,
        dosyaId: '13122222',
        isinAdi: '2020 Yılı 17 Kalem Tıbbi Cihaz Alımı',
        aciklama:
            'İhale dokümanı ekinde yer alan Talep Dağılım Cetvelindeki hastanelere teslim edilecektir.',
        mudurlukAdi: 'Satınalma Müdürlüğü',
        daireBasAdi: 'Satınalma Daire Başkanlığı',
        tur: 'Doğrudan Temin',
        usul: '4734/19',
        yaklasikMaliyet: 300000000.50,
      ),
      IhaleModel(
        id: 13123910,
        dosyaId: '13122222',
        isinAdi: '19 Kalem Sterilizasyon Tüketim Malzeme Alımı',
        aciklama:
            'İhale dokümanı ekinde yer alan Talep Dağılım Cetvelindeki hastanelere teslim edilecektir.',
        mudurlukAdi: 'Satınalma Müdürlüğü',
        daireBasAdi: 'Satınalma Daire Başkanlığı',
        tur: 'İhale',
        usul: '4734/19',
        yaklasikMaliyet: 200000,
      ),
      IhaleModel(
        id: 13123910,
        dosyaId: '13122222',
        isinAdi: '19 Kalem Sterilizasyon Tüketim Malzeme Alımı',
        aciklama:
            'İhale dokümanı ekinde yer alan Talep Dağılım Cetvelindeki hastanelere teslim edilecektir.',
        mudurlukAdi: 'Satınalma Müdürlüğü',
        daireBasAdi: 'Satınalma Daire Başkanlığı',
        tur: 'İhale',
        usul: '4734/19',
        yaklasikMaliyet: 200000,
      ),
      IhaleModel(
        id: 13123910,
        dosyaId: '13122222',
        isinAdi: '19 Kalem Sterilizasyon Tüketim Malzeme Alımı',
        aciklama:
            'İhale dokümanı ekinde yer alan Talep Dağılım Cetvelindeki hastanelere teslim edilecektir.',
        mudurlukAdi: 'Satınalma Müdürlüğü',
        daireBasAdi: 'Satınalma Daire Başkanlığı',
        tur: 'İhale',
        usul: '4734/19',
        yaklasikMaliyet: 200000,
      ),
      IhaleModel(
        id: 13123910,
        dosyaId: '13122222',
        isinAdi: '19 Kalem Sterilizasyon Tüketim Malzeme Alımı',
        aciklama:
            'İhale dokümanı ekinde yer alan Talep Dağılım Cetvelindeki hastanelere teslim edilecektir.',
        mudurlukAdi: 'Satınalma Müdürlüğü',
        daireBasAdi: 'Satınalma Daire Başkanlığı',
        tur: 'İhale',
        usul: '4734/19',
        yaklasikMaliyet: 200000,
      ),
      IhaleModel(
        id: 13123910,
        dosyaId: '13122222',
        isinAdi: '19 Kalem Sterilizasyon Tüketim Malzeme Alımı',
        aciklama:
            'İhale dokümanı ekinde yer alan Talep Dağılım Cetvelindeki hastanelere teslim edilecektir.',
        mudurlukAdi: 'Satınalma Müdürlüğü',
        daireBasAdi: 'Satınalma Daire Başkanlığı',
        tur: 'İhale',
        usul: '4734/19',
        yaklasikMaliyet: 200000,
      ),
      IhaleModel(
        id: 13123910,
        dosyaId: '13122222',
        isinAdi: '19 Kalem Sterilizasyon Tüketim Malzeme Alımı',
        aciklama:
            'İhale dokümanı ekinde yer alan Talep Dağılım Cetvelindeki hastanelere teslim edilecektir.',
        mudurlukAdi: 'Satınalma Müdürlüğü',
        daireBasAdi: 'Satınalma Daire Başkanlığı',
        tur: 'İhale',
        usul: '4734/19',
        yaklasikMaliyet: 200000,
      ),
    ];
    print(allIhaleList.length);
    await new Future.delayed(new Duration(seconds: 1));
    return allIhaleList;
  }

  @override
  Future<IhaleModel> explanationIhale(int id) {

  }

  @override
  Future<IhaleModel> rejectIhale(int id) {

  }

  @override
  Future<IhaleModel> confirmIhale(int id) {

  }
}
