import 'package:cocoon_admin/features/auth/data/datasource/auth_datasource.dart';
import 'package:cocoon_admin/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDataSource local;

  AuthRepositoryImpl(this.local);

  @override
  @override
Future<void> login(String email, String password) async {
  final cleanEmail = email.trim().toLowerCase();
  final cleanPassword = password.trim();

  print("Email: '$cleanEmail'");
  print("Password: '$cleanPassword'");

  if (cleanEmail == "admin@gmail.com" && cleanPassword == "1234") {
    await local.saveLogin();
  } else {
    throw Exception("Invalid credentials");
  }
}

  @override
  Future<void> logout() {
    return local.logout();
  }

  @override
  Future<bool> isLoggedIn() {
    return local.isLoggedIn();
  }
}