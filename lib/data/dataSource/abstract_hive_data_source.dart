abstract class HiveDataSource<T> {
  Future<int> add(T model);

  T? getAt(int index);

  List<T> getAll();

  Future<void> deleteAt(int index);

}
