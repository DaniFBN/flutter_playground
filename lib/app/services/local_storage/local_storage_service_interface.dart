abstract class ILocalStorageService {
  Future<void> delete(String collection, String keyValue);
  Future<Map> get(String collection);
  Future<void> put(String collection, Map value);
}
