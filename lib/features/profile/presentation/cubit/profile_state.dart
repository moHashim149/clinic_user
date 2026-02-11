part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}


class LogOutLoading extends ProfileState {}

class DeleteAccLoading extends ProfileState {}

class DeleteAccAndLogOutFailure extends ProfileState {}

class DeleteAccAndLogOutSuccess extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileFailure extends ProfileState {}

class ProfileSuccess extends ProfileState {}


