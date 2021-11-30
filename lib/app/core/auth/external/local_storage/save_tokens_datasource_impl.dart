import 'package:flutter_training/app/core/auth/domain/entities/save_tokens_entity.dart';
import 'package:flutter_training/app/core/auth/domain/types.dart';
import 'package:flutter_training/app/core/auth/external/mapper.dart';
import 'package:flutter_training/app/core/auth/infra/datasources/save_tokens_datasource_interface.dart';
import 'package:flutter_training/app/services/local_storage/local_storage_service_interface.dart';

class SaveTokensDatasourceImpl implements ISaveTokensDatasource {
  final ILocalStorageService storage;

  SaveTokensDatasourceImpl(this.storage);

  @override
  Future<SaveTokensEntity> saveToken(SaveTokensPayload payload) async {
    final formattedData = TokenEntityMapper.toJson(payload);
    await storage.put('authCollection', formattedData);

    return SaveTokensEntity();
  }
}
