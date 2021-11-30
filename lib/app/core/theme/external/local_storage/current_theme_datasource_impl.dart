import 'package:flutter_training/app/core/theme/domain/entities/current_theme_entity.dart';
import 'package:flutter_training/app/core/theme/external/mapper.dart';
import 'package:flutter_training/app/core/theme/infra/datasources/current_theme_datasource_interface.dart';
import 'package:flutter_training/app/services/local_storage/local_storage_service_interface.dart';

class CurrentThemeDatasourceImpl implements ICurrentThemeDatasource {
  final ILocalStorageService storage;

  CurrentThemeDatasourceImpl(this.storage);

  @override
  Future<CurrentThemeEntity> getTheme() async {
    final currentTheme = await storage.get('themeCollection');

    return CurrentThemeEntityMapper.fromJson(currentTheme);
  }
}
