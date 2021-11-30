import 'package:flutter_training/app/core/auth/domain/entities/get_tokens_entity.dart';
import 'package:flutter_training/app/core/auth/external/mapper.dart';
import 'package:flutter_training/app/core/auth/infra/datasources/get_tokens_datasource_interface.dart';
import 'package:flutter_training/app/services/local_storage/local_storage_service_interface.dart';

class GetTokensDatasourceImpl implements IGetTokensDatasource {
  final ILocalStorageService storage;

  GetTokensDatasourceImpl(this.storage);

  @override
  Future<GetTokensEntity> getTokens() async {
    final tokens = await storage.get('authCollection');
    final entity = TokenEntityMapper.fromJson(tokens);

    return entity;
  }
}
