import 'package:equatable/equatable.dart';

class AuthEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SignInEvent extends AuthEvent {}

class SignOutEvent extends AuthEvent {}
