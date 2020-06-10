abstract class BaseDataSource<T> {
  Future<T> get(int id);
  Future<List<T>> getList();
}
