import 'package:e_book/features/auth/data/data_sources/auth_data_source.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../domain/repositories/auth_repo.dart';

class AuthRepository implements AuthRepo {
  AuthDataSource authDataSource;
  AuthRepository({required this.authDataSource});
  @override
  Stream<GoogleSignInAccount?> getCurrentUser() {
    return authDataSource.user;
  }

  @override
  Future<void> signIn() async {
    try {
      await authDataSource.handleSignIn();
    } catch (e) {
      print("An error has occurred: ${e.toString()}");
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await authDataSource.signOut();
    } catch (e) {
      print("An error has occurred: ${e.toString()}");
    }
  }
}
