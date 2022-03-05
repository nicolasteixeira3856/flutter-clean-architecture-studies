import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/app/auth/domain/entities/logged_user.dart';
import 'package:flutter_clean_architecture/app/auth/domain/errors/errors.dart';
import 'package:flutter_clean_architecture/app/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_clean_architecture/app/auth/domain/usecases/login_usecase.dart';
import 'package:flutter_clean_architecture/app/auth/infra/datasources/auth_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource datasource;

  AuthRepositoryImpl(this.datasource);

  @override
  Future<Either<AuthException, LoggedUser>> login(
      CredentialsParams params) async {
    try {
      final user = await datasource.login(params);
      return Right(user);
    } on AuthException catch (e) {
      return Left(e);
    } on Exception {
      return Left(AuthException('Exception error'));
    }
  }
}
