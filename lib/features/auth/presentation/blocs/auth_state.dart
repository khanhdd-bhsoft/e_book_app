import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class LoadingState extends AuthState {}

class ErrorAuthState extends AuthState {
  final String? message;
  ErrorAuthState({this.message});
  @override
  List<Object> get props => [message!];
}

class AuthorizedState extends AuthState {}

class UnAuthStateState extends AuthState {}
