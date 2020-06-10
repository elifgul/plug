import 'package:plug/feature/domain/entity/ihale.dart';

abstract class IhaleRepository {
   Future<List<Ihale>> getIhaleList();
   Future<Ihale> getIhale(int id);
   Future<Ihale> confirmIhale(int id);
   Future<Ihale> rejectIhale(int id);
   Future<Ihale> explanationIhale(int id);
}
