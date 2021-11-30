import 'dart:async';
import 'dart:collection';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'local_storage_service_interface.dart';

class HiveLocalStorageService extends Module implements ILocalStorageService {
  Future<void> load() async {
    await Hive.initFlutter();
  }

  @override
  Future<Map> get(String collection) async {
    final box = await _getBox(collection);

    return _boxToMap(box);
  }

  @override
  Future<void> delete(String collection, String keyValue) async {
    final box = await _getBox(collection);

    await box.delete(keyValue);

    await _closeBox(box);
  }

  @override
  Future<void> put(String collection, Map value) async {
    final box = await _getBox(collection);

    await box.putAll(value);

    unawaited(_closeBox(box));
  }

  Map _boxToMap(Box box) {
    final Map response = HashMap();
    for (String key in box.keys) {
      response.addAll({key: box.get(key)});
    }

    return response;
  }

  Future<Box> _getBox(String collection) async {
    if (Hive.isBoxOpen(collection)) return Hive.box(collection);
    return await Hive.openBox(collection);
  }

  Future<void> _closeBox(Box box) async {
    await box.compact();
    await box.close();
  }
}
