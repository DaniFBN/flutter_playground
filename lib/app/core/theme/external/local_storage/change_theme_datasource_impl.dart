import 'package:flutter_training/app/core/theme/domain/entities/change_theme_entity.dart';
import 'package:flutter_training/app/core/theme/domain/types.dart';
import 'package:flutter_training/app/core/theme/infra/datasources/change_theme_datasource_interface.dart';
import 'package:flutter_training/app/services/local_storage/local_storage_service_interface.dart';

class ChangeThemeDatasourceImpl implements IChangeThemeDatasource {
  final ILocalStorageService storage;

  ChangeThemeDatasourceImpl(this.storage);

  @override
  Future<ChangeThemeEntity> changeTheme(ChangeThemePayload payload) async {
    await storage.put('themeCollection', {'theme': payload.theme.index});

    return ChangeThemeEntity(theme: payload.theme);
  }
}
