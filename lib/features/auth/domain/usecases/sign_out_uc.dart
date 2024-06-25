import 'package:e_book/features/auth/domain/repositories/auth_repo.dart';

class SignOutUseCase {
  AuthRepo authRepo;
  SignOutUseCase({required this.authRepo});
  Future<void> call() async {
    await authRepo.signOut();
  }
}
