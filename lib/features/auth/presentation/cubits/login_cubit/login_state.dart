part of 'login_cubit.dart';

@immutable
abstract class SignInState {}

class SignInInitial extends SignInState {}
class CheckPhoneLoading extends SignInState {}
class CheckPhoneFailure extends SignInState {}
class CheckPhoneSuccess extends SignInState {}
