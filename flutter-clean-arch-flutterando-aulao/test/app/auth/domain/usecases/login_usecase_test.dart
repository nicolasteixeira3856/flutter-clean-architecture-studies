import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/app/auth/domain/entities/logged_user.dart';
import 'package:flutter_clean_architecture/app/auth/domain/errors/errors.dart';
import 'package:flutter_clean_architecture/app/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_clean_architecture/app/auth/domain/usecases/login_usecase.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class AuthRepositoryMock extends Mock implements AuthRepository {}

// @override
// Future<Either<AuthException, LoggedUser>> login(
//     CredentialsParams params) async {
//   if (params.password == '1234') {
//     return Left(AuthException('repository error'));
//   }
//
//   return Right(LoggedUser(
//       email: 'nicolasteixeira3856@outlook.com', password: params.password));
// }

void main() {
  final repository = AuthRepositoryMock();
  final usecase = LoginUsecase(repository);
  final params = CredentialsParams(
      email: 'nicolasteixeira3856@outlook.com', password: '123456');

  test('Should make login', () async {
    when(() => repository.login(params)).thenAnswer((_) async => Right(
        LoggedUser(
            email: 'nicolasteixeira3856@outlook.com',
            password: params.password)));

    final result = await usecase(params);

    expect(result.isRight(), true);
    expect(result.getOrElse(() => LoggedUser(email: '', password: '')).email,
        'nicolasteixeira3856@outlook.com');
  });

  test('Should throw error when email is invalid', () async {
    final result = await usecase(
        CredentialsParams(email: 'nicolasteixeira', password: '123456'));

    //final leftValue = result.fold(id, id) as AuthException;
    expect(result.isLeft(), true);
  });

  test('Should throw error when password is empty', () async {
    final result = await usecase(CredentialsParams(
        email: 'nicolasteixeira3856@outlook.com', password: ''));

    expect(result.isLeft(), true);
  });

  test('Should throw error when repository fails', () async {
    when(() => repository.login(params))
        .thenAnswer((_) async => Left(AuthException('error')));

    final result = await usecase(params);

    expect(result.isLeft(), true);
  });
}
