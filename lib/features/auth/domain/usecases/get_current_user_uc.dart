import 'package:e_book/features/auth/domain/repositories/auth_repo.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GetCurrentUserUseCase {
  AuthRepo authRepo;
  GetCurrentUserUseCase({required this.authRepo});
  Stream<GoogleSignInAccount?> call() {
    return authRepo.getCurrentUser();
  }
}
