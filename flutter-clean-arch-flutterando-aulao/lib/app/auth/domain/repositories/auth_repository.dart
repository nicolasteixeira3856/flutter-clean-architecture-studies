import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/app/auth/domain/entities/logged_user.dart';
import 'package:flutter_clean_architecture/app/auth/domain/usecases/login_usecase.dart';

import '../errors/errors.dart';

abstract class AuthRepository {
  Future<Either<AuthException, LoggedUser>> login(CredentialsParams params);
}
