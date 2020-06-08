import 'package:plug/feature/data/datasource/datasource.dart';
import 'package:plug/feature/data/model/ihale_model.dart';

abstract class IhaleLocalDataSource extends BaseDataSource<IhaleModel> {}

class IhaleLocalDataSourceImpl implements IhaleLocalDataSource {
  @override
  Future<IhaleModel> get(int id) {}

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
        tur: 'İH',
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
        tur: 'DT',
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
        tur: 'İH',
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
        tur: 'İH',
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
        tur: 'İH',
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
        tur: 'İH',
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
        tur: 'İH',
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
        tur: 'İH',
        usul: '4734/19',
        yaklasikMaliyet: 200000,
      ),
    ];
    print(allIhaleList.length);
    await new Future.delayed(new Duration(seconds: 2));
    return allIhaleList;
  }
}
