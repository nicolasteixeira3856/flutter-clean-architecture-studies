import 'package:flutter_clean_architecture/app/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_clean_architecture/app/auth/domain/usecases/login_usecase.dart';
import 'package:flutter_clean_architecture/app/auth/external/auth_api/auth_api.dart';
import 'package:flutter_clean_architecture/app/auth/external/firebase/firebase_auth_impl.dart';
import 'package:flutter_clean_architecture/app/auth/infra/datasources/auth_datasource.dart';
import 'package:flutter_clean_architecture/app/auth/infra/repositories/auth_repository_impl.dart';
import 'package:kiwi/kiwi.dart';

final container = KiwiContainer()
  ..registerFactory((container) => LoginUsecase(container.resolve()))
  ..registerFactory<AuthRepository>(
      (container) => AuthRepositoryImpl(container.resolve()))
  ..registerFactory<AuthDatasource>((container) => FirebaseAuth());

// final container = KiwiContainer()
//   ..registerFactory((container) => LoginUsecase(container.resolve()))
//   ..registerFactory<AuthRepository>(
//           (container) => AuthRepositoryImpl(container.resolve()))
//   ..registerFactory<AuthDatasource>((container) => AuthApi());

main() {
  final usecase = container.resolve<LoginUsecase>();
}
