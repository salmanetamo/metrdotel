import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:metrdotel/core/storage/i_storage.dart';

@Injectable(as: IStorage)
class Storage implements IStorage{
  final FlutterSecureStorage _storage;

  Storage(this._storage);

  @override
  Future<void> clear() {
    return this._storage.deleteAll();
  }

  @override
  Future<dynamic> get({required String key}) {
    return this._storage.read(key: key);
  }

  @override
  Future<void> remove({required String key}) {
    return this._storage.delete(key: key);
  }

  @override
  Future<void> set({required String key, value}) {
    return this._storage.write(key: key, value: value);
  }

  @override
  Future<bool> contains({required String key}) {
    return this._storage.containsKey(key: key);
  }
}