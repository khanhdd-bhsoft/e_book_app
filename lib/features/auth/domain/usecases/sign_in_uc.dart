import '../repositories/auth_repo.dart';

class SignInUseCase {
  AuthRepo authRepo;
  SignInUseCase({required this.authRepo});
  Future<void> call() async {
    await authRepo.signIn();
  }
}
