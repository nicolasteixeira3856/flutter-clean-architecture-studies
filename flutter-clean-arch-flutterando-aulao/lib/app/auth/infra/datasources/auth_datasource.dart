import 'package:flutter_clean_architecture/app/auth/domain/entities/logged_user.dart';
import 'package:flutter_clean_architecture/app/auth/domain/usecases/login_usecase.dart';

abstract class AuthDatasource {
  Future<LoggedUser> login(CredentialsParams params);
}