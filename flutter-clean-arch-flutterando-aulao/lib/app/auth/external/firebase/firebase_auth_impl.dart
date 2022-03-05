import 'package:flutter_clean_architecture/app/auth/domain/entities/logged_user.dart';
import 'package:flutter_clean_architecture/app/auth/domain/usecases/login_usecase.dart';
import 'package:flutter_clean_architecture/app/auth/infra/datasources/auth_datasource.dart';

class FirebaseAuth implements AuthDatasource {
  @override
  Future<LoggedUser> login(CredentialsParams params) async {
    return LoggedUser(email: 'nicolasteixeira3856@outlook.com', password: '123456');
  }

}