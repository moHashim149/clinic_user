part of 'login_cubit.dart';

@immutable
abstract class SignInState {}

class SignInInitial extends SignInState {}
class SignInLoading extends SignInState {}
class SignInFailure extends SignInState {}
class SignInSuccess extends SignInState {}
