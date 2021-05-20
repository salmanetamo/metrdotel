abstract class IStorage {
  Future<void> set({required String key, required dynamic value});
  Future<dynamic> get({required String key});
  Future<bool> contains({required String key});
  Future<void> remove({required String key});
  Future<void> clear();
}