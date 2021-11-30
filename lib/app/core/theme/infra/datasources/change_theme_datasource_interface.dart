import 'package:flutter_training/app/core/theme/domain/entities/change_theme_entity.dart';
import 'package:flutter_training/app/core/theme/domain/types.dart';

abstract class IChangeThemeDatasource {
  Future<ChangeThemeEntity> changeTheme(ChangeThemePayload payload);
}
