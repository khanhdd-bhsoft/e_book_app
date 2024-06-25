import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthRepo {
  Future<void> signIn();
  Future<void> signOut();
  Stream<GoogleSignInAccount?> getCurrentUser();
}
