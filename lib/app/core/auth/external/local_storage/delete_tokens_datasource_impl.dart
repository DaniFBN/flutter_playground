import 'package:flutter_training/app/core/auth/domain/entities/delete_tokens_entity.dart';
import 'package:flutter_training/app/core/auth/infra/datasources/delete_tokens_datasource_interface.dart';
import 'package:flutter_training/app/services/local_storage/local_storage_service_interface.dart';

class DeleteTokensDatasourceImpl implements IDeleteTokensDatasource {
  final ILocalStorageService storage;

  DeleteTokensDatasourceImpl(this.storage);

  @override
  Future<DeleteTokensEntity> deleteTokens() async {
    await storage.delete('authCollection', 'access');
    await storage.delete('authCollection', 'refresh');

    return DeleteTokensEntity();
  }
}
