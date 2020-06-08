import 'package:plug/feature/domain/entity/ihale.dart';

abstract class IhaleRepository {
   Future<List<Ihale>> getIhaleList();
   Future<Ihale> getIhale(int id);
   Future<bool> confirmIhale(int id);
   Future<bool> rejectIhale(int id);
   Future<bool> explanationIhale(int id);
}
