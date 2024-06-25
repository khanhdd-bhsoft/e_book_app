import 'package:e_book/features/auth/domain/usecases/get_current_user_uc.dart';
import 'package:e_book/features/auth/domain/usecases/sign_in_uc.dart';
import 'package:e_book/features/auth/domain/usecases/sign_out_uc.dart';
import 'package:e_book/features/auth/presentation/blocs/auth_event.dart';
import 'package:e_book/features/auth/presentation/blocs/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  GetCurrentUserUseCase getCurrentUserUseCase;
  SignInUseCase signInUseCase;
  SignOutUseCase signOutUseCase;
  AuthBloc(
      {required this.getCurrentUserUseCase,
      required this.signInUseCase,
      required this.signOutUseCase})
      : super(AuthInitial()) {
    on<SignInEvent>(onSignInEvent);
    on<SignOutEvent>(onSignoutEvent);
  }
  Future<void> onSignInEvent(SignInEvent event, Emitter<AuthState> emit) async {
    try {
      emit(LoadingState());
      final result = await signInUseCase.call();
      emit(AuthorizedState());
    } catch (e) {
      emit(ErrorAuthState(message: e.toString()));
    }
  }

  Future<void> onSignoutEvent(
      SignOutEvent event, Emitter<AuthState> emit) async {
    try {
      emit(LoadingState());
      final result = await signOutUseCase.call();
      emit(UnAuthStateState());
    } catch (e) {
      emit(ErrorAuthState(message: e.toString()));
    }
  }
}
