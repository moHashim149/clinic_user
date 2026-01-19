part of 'edit_profile_cubit.dart';

@immutable
sealed class EditProfileState {}

final class EditProfileInitial extends EditProfileState {}
final class EditProfileLoading extends EditProfileState {}
final class EditProfileLoaded extends EditProfileState {}
final class EditProfileFailure extends EditProfileState {
  final String error;

  EditProfileFailure({required this.error});
}
