import 'package:flutter_training/app/core/auth/domain/entities/login_email_entity.dart';
import 'package:flutter_training/app/core/auth/domain/types.dart';

abstract class ILoginEmailDatasource {
  Future<LoginEmailEntity> login(LoginEmailPayload payload);
}
